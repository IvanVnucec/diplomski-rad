## Installing
```
NOTE: Recommended OS for developing is Ubuntu 21.10 (also Ubuntu 20.04).
```
1. (recommended) Fork and clone the repository and `cd` into project root directory.
    - or if you don't know Git, download files [here](https://github.com/IvanVnucec/predlozak-za-diplomski-zavrsni-ili-seminarski-rad/archive/refs/heads/master.zip)
2. If on Ubuntu run `sudo make install` to install LaTex tools, 
    - otherwise, install [MiKTeX](https://miktex.org/).

## Writing
1. Make changes in `rad.tex` and `literatura.bib`, other files leave unchanged. 
    - For template usage see [Help](#help).

## Building
1. Run `make build` to build PDF document in `build/rad.pdf`.
2. (optional) If you fork the repository, check out GH Actions: on every push
GH Actions will build the LaTex document and upload it as Actions build artifact.
```

## Help
For Latex Template help see [docs/LaTeX_template_upute.pdf](docs/LaTeX_template_upute.pdf).
https://www.fer.unizg.hr/_download/zavrsni_radovi/prefix/hr_0036507815_48.pdf

## References
[Predlozak za Diplomski, Zavrsni ili Seminarski rad](https://github.com/IvanVnucec/predlozak-za-diplomski-zavrsni-ili-seminarski-rad)
