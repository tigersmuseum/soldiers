
## Some useful regular expressions

description | find | replace
--- | --- | ---
A span starting with number and ending with capitalised surname | `(No\.\s+)?\d+\s+.*?(\s+[A-Z][a-z]+)+\b` | `<span class="person">$0</span>`
Majors | `Maj\w*?\s+.*?(\s+[A-Z][a-z]+)+\b` | `<span class="person">$0</span>`
Captains | `Capt\w*?\s+.*?(\s+[A-Z][a-z]+)+\b` | `<span class="person">$0</span>`
Lieutenant | `((2|2/|2nd\s+?)?(Lieut\w*?|Lt\.?)\s+.*?(\s+[A-Z][a-z]+)+)\b` | `<span class="person">$0</span>`
Hyphenated surname | `</span>((\-[A-Z][a-z]+)+)` | `$1</span>`
Add suffix | `</span>((\s+(DSO|D\.S\.O\.|MC|M\.C\.|MM|M\.M\.|DCM|D\.C\.M\.|OBE|O\.B\.E\.|GOC|G\.O\.C\.),?)+)` | `$1</span>`

