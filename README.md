# Orthographic Neighborhood

Takes in a string, and generates a list of strings. In each string, one, and
only one, word is switched for an orthographic neighbor. The list contains all
the possibilites, based on whether they pass a dictionary check. I was lazy, so
the dictionary is currently hard-coded and like 1000% responsible for the
gigantic size of this repo.

---

Example usage:

```
path/to/cloned/repo $ bin/orthographic_neighborhood my string
```

would return

```
y string
m string
ay string
by string
ey string
fy string
hy string
ky string
ny string
sy string
ma string
me string
mi string
mo string
amy string
omy string
may string
mya string
my sting
my spring
my strang
my strong
my strung
my stringy
```

---

## Dictionary

As stated above, the dictionary is currently hard-coded. I copied it from
[matthewreagan/WebstersEnglishDictionary](https://github.com/matthewreagan/WebstersEnglishDictionary),
using their `dictionary_compact.json` and passing it through `jsonlint`, as I
was receiving parsing errors. It would be super rad if this were modified to
allow a dictionary be given. I imagine there would need to be changes in how
`Dictionary#[]` does its lookups based on the casing of keys in dictionaries.
One would need to be able to specify this when they specified a dictionary
source.

---

## Room for improvement

I see a few expansions that could be expanded upon to make this better:
+ A consumer can supply their own dictionary.
+ Non-[a-zA-Z] characters don't break neighbor generation for the word.
+ Different alphabets can be used.

If you're interested in making any of the above happen, open a PR or an issue!

---

## LICENSE

MIT. See LICENSE.md for details.
