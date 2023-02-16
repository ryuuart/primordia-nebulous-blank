# blank

This is the grand starter to any new creative venture. Right now, I've provided some starter juice that would allow any project to be portable. Right now, because of how slow `devcontainers` are, I'm going to stick with native workflows using `docker compose`. 

## Configuration

### autoenv
I'm using [autoenv](https://github.com/hyperupcall/autoenv) to automatically "activate" my projects with the right environmental configurations if I'm developing locally. These should focus on using shell scripts that are reproducible across environments.

Right now, my `autoenv` is configured to use these defaults for the `env` file.

```shell
export AUTOENV_ENV_FILENAME=".autoenv"
export AUTOENV_ENV_LEAVE_FILENAME=".autoenv.leave"
```

### .devcontainer
I also have a `.devcontainer` provided if I'm developing on the cloud. Ideally, I would configure `.devcontainer` and `.autoenv` to use the same shell scripts to auto-initialize any project.

> **Note**
> I'm currently using the `.autoenv` as the initial script in `.devcontainer`

### docker
I use Docker + Docker Compose to use my source code. The `.devcontainer` is an isolation layer that would install environmental configurations. The Docker Compose file should be used locally or in a `.devcontainer` without any discernable differences.

> **Note**
>
> This is an experiment to create a whole system of interconnected repositories that are universally configured, documented, and maintainable.
