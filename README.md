# lab01-flask

### Install commitizen dependencies
pip install -U commitizen
pip install pre-commit


### Start the commit file
cz init
    > ".cz.toml"
    > "cz_conventional_commits"
    > "commitizen: Fetch and set version in commitizen config (default)"
    > Escolha a ultima TAG (Caso não tenha selecione a 0.0.0)
    > "semver"
    > Is "v$version" the correct tag format? "N"
    > Aperta "Enter"
    > "Create changelog automatically on bump "Y"
    > Keep major version zero (0.x) during breaking changes "N"
    > "commit-msg"