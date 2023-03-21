# MkDocs

"MkDocs is a fast, simple and downright gorgeous static site generator that's geared towards building project documentation. Documentation source files are written in Markdown, and configured with a single YAML configuration file."

<a href="https://www.mkdocs.org/">https://www.mkdocs.org/</a>

## Pre-Req
### Dependencies
 - recent version of Python and pip

    !!! Tip
        **Ubuntu** comes with a version of **Python**, so only **pip** needed to be installed. Check the version of Python installed with `python --version`.

## Installation

```sh 
$ pip install mkdocs
``` 

### Creating new Wiki

```sh
$ mkdocs new <project-name>
```
`mkdocs` will create a new project named `<project-name>` current directory. `cd`-ing into that directory shows the below starter structure.

```sh
.
|-- mkdocs.yml
+-- docs/
|   +-- index.md
```
### Configuration
configuration is handled through the `mkdocs.yml` file, at first it'll look like

```yml
site_name: MkDocs
```
`site_name` is equivilant to the `<title>` tag in html, it defines the name of the website along with the heading that is displayed on page.

**Additional Useful Parameters**

`site_url` defines the url that the sites will be accessible by.

`nav` defines the navigation on the site, each page is then listed in points nested under in a key-value style defining `Name:pagefile.md`

## Deployment
For this site, it is deployed using <a href="https://pages.github.com/">GitHub Pages</a>. Using the command `$ mkdocs build` mkdocs generates a `site` directory in the project root where resides the static rendering of the wiki.

For best experience, the static site is pushed to it's own dedicated branch called `gh-pages` using `git subtree push --prefix site origin gh-pages`. This pushes only the `site` directory to the `gh-pages` branch.

From GitHub repo, under `Settings > Pages > Build and deployment` we indicate we want the `Source` to be `Deploy from a branch` and the `Branch` to be `gh-pages/(root)`.

A custom domain can also be configured tot his page.

!!! Note
    Custom domains will need to be verified via CNAME by GitHub before GitHub will accept it. Useful information about that can be found <a href="https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site">here</a>.