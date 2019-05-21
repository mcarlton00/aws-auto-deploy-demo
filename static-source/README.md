# Overview

This is the repo for our wiki based on [MkDocs](https://github.com/mkdocs/mkdocs).  We're using the [Material](https://github.com/squidfunk/mkdocs-material) theme, which supports a collapsable site map and a separate Table of Contents.

# Getting Started

MkDocs can easily be ran locally.  This allows you to view
 how your changes will look before pushing them to the repo.

1. Clone and enter the git repo

    ```
    git clone ssh://git@nerdyredneck.net:22005/nerdyredneck/wiki-source.git
    cd wiki-source
    ```

2. Create a virtualenv to keep the packages isolated from the rest of your system.  View the [wiki](https://nerdyredneck.net/wiki/IT_Shenanigans/Other/virtualenvs/) for more detailed instructions.

    NOTE: If you name your virtualenv `env`, git won't complain about unstaged files in your local directory

    `virtualenv env`

3. Activate your newly created virtualenv

    `source env/bin/activate`

4. Install MkDocs and other requirements

    `env/bin/pip install -r requirements.txt`

5. Run MkDocs

    `mkdocs serve`

You can now view the wiki in a browser at `http://localhost:8000`.  This will update in real time as you save files.

If you are adding new pages, they must be added to the page list in `mkdocs.yml`
