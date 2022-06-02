## Installing
```
NOTE: Recommended OS for developing is Ubuntu 21.10 (also Ubuntu 20.04).
```
1. (recommended) Fork and clone the repository and `cd` into project root directory.
    - or if you don't know Git, download files [here](https://github.com/IvanVnucec/predlozak-za-diplomski-zavrsni-ili-seminarski-rad/archive/refs/heads/master.zip)
2. If on Ubuntu run `sudo make install` to install LaTex tools (about 275 MB), 
    - otherwise, install [MiKTeX](https://miktex.org/).

## Writing
Make changes in `rad.tex` and `literatura.bib`, other files leave unchanged. 
- For template usage see [Help](#help).

## Spellchecking
To spellcheck the text, run `make spellcheck`. Highlighted words will appear in
the console. To add certain unknown word (aka to disable spellcheck warnings), 
append it to the `dictionary.txt` file located in the root dir. The `dictionary.txt`
file contains user defined words.

## Building
1. Run `make build` to build PDF document in `build/rad.pdf`.
2. (optional) If you fork the repository, check out GH Actions: on every push
GH Actions will build the LaTex document and upload it as Actions build artifact.

## Files
```
.
├── .github             - direktorij za GitHub Actions
├── build               - direktorij sa build artefaktima (ukljucujuci .pdf)
├── docs                - direktorij sa LaTex template uputama
├── scripts             - direktorij sa pomocnim skriptama
├── templates           - direktorij sa LaTex template-ovima (moguce modificirat) 
├── tests               - direktorij sa LaTex template testovima 
├── .gitignore          - gitignore 
├── dictionary.txt      - korisnikov rjecnik (sluzi za ispravljanje pravopisa) 
├── enumitem.sty        - dodatni paket za LaTex (ne modificiraj)
├── literatura.bib      - ovdje su citati (ovo modificiraj)
├── LICENSE             - licenca
├── Makefile            - omogucuje instaliranje alata, buildanje PDF dokumenta...
├── rad.tex             - ovdje je rad (ovo modificiraj)
├── README.md           - readme
└── tocbibind.sty       - dodatni paket za LaTex (ne modificiraj)
```

## Help
- for usage help run `make help`
- for Latex Template help see [docs/LaTeX_template_upute.pdf](docs/LaTeX_template_upute.pdf).

## References
1. [LaTex Predlozak](https://github.com/IvanVnucec/predlozak-za-diplomski-zavrsni-ili-seminarski-rad#spellchecking)