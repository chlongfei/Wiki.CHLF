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

### Auto Deployment with GitHub Workflows
Credit to <a href="https://blog.elmah.io/author/thomas/">Thomas Ardal</a> on <a href="blog.elmah.io">elmah.io</a> for the below workflow yml file that allowed for auto deployment into with GitHub workflows. 

```yml
name: build
on:
  push:
    branches:
      - main
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-python@v2
        with:
          python-version: 3.x
      - run: pip install mkdocs
      - run: mkdocs gh-deploy --force --clean --verbose

```
Above configuration is placed inside `.github/workflows/build.yml` and committed into the project `main` branch. GitHub will pick it up automatically and run whenever a new commit is pushed to the branch.

The GitHub workflow runs the `mkdocs gh-deploy --force --clean --verbose` command in their environment where it'll build the wiki and copy it into the `gh-pages` branch of the project.

Aftwards, GitHub pages takes over and deployes the newly committed static files to your page.

#### **Permissions**
An issue that occured during initial deployment was that the `github-actions[bot]` was unable to performactions on the branches in the repository. This was resolved through settings the Workflow permissions under `Settings > Code and automation > Actions > General > Workflow permissions`, setting that to **Read and write permissions** resolved that issue. 

!!! Note
    Custom domains will need to be verified via CNAME by GitHub before GitHub will accept it. Useful information about that can be found <a href="https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site">here</a>.

<!-- Author / Footer -->
---
<div  style="text-align: right; font-size:small; color:grey">LChen - March 21, 2023</div>