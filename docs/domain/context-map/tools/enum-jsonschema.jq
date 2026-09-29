# likec4 export json の出力から、$prefix（コンテキストの FQN）の下の列挙型（種類 enum）をすべて JSON Schema にする。
# 出力は { "<列挙型の英名>": <JSON Schema>, ... }。英名のない列挙型があれば "error" に並べる。列挙型を足しても式は変えない。
# - title は列挙型の和名、description は説明の最初の段落（リンクは文字だけ）
# - enum は子要素（種類 enumValue）の値。metadata.value があればそれを、なければ要素の ID を使う
# - x-enumDescriptions は値の和名（説明があり、和名と違えば「和名（説明）」）
# - 値が ID と違う値を含む列挙型は、x-enum-varnames に要素の ID を並べる（生成コードの定数名になる）
def text: (.md // .txt // "");
def first_paragraph: (text | split("\n\n")[0] // "") | gsub("\\[(?<t>[^\\]]+)\\]\\([^)]+\\)"; "\(.t)");
def english: (.summary.txt // .summary.md // null);
def lastseg: .id | split(".") | last;
def value: (.metadata.value // lastseg);

.elements as $els
| [$els[] | select(.kind == "enum" and (.id | startswith($prefix + ".")))] as $enums
| ($enums | map(select((. | english) == null) | .id)) as $missing
| ($enums
   | map(. as $enum
       | [$els[] | select(.kind == "enumValue" and (.id | startswith($enum.id + ".")) and ((.id | split(".") | length) == ($enum.id | split(".") | length) + 1))] as $values
       | select($values | length > 0)
       | select(($enum | english) != null)
       | {
           key: ($enum | english),
           value: (
             {
               type: "string",
               title: $enum.title,
               description: ($enum.description | first_paragraph),
               enum: [$values[] | value]
             }
             # 値が ID と違う（metadata.value を使う）列挙型では、生成コードの定数名に使えるよう ID を並べる
             + (if ($values | any(.metadata.value != null)) then { "x-enum-varnames": [$values[] | lastseg] } else {} end)
             + {
               "x-enumDescriptions": ($values | map({
                 key: value,
                 value: (if (.description | text) == "" or (.description | first_paragraph) == .title then .title else "\(.title)（\(.description | first_paragraph)）" end)
               }) | from_entries)
             }
           )
         })
   | from_entries) as $schemas
| if ($missing | length) > 0 then { error: $missing } else $schemas end
