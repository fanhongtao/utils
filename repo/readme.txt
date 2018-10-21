Design principles
1. Use a project-list-file to specify which projects will be handled.
2. The scripts should be executed in the base directory.


Usage:
Execute on the server:
    create_server_repos.sh - Create git bare repositories on server. (Using input file)

Execute on the client
    init_repos.sh - Initial git repositories & do the first commit. (Using input file)
    sync_repos.sh - Clone or pull repositories from the server. (Using .project/project.list)
    git_all.sh    - Execute common git command. (Using .project/project.list)
    git_status.sh - Show status of repositories that need to work with. (Using .project/project.list)
    record_last_logs.sh - Record the last log of each repositories. (Using .project/project.list)
    
    add_remote.sh - Execute 'git add remote ...', can be replaced by 'git_all.sh'. (Using .project/project.list)
    push_repos.sh - Execute 'git push', can be replaced by 'git_all.sh'. (Using .project/project.list)
    pull_repos.sh - Execute 'git pull', can be replaced by 'git_all.sh'. (Using .project/project.list)



Server side repositories management:

File 'project.list' demonstrate the fellowing directories on the server.
  base
    |-- build.git
    |-- device
    |   |-- common.git 
    |   |-- google
    |   |   |-- accessory  
    |   |       |-- arduino.git
    |   |       |-- demokit.git
    |   |-- htc
    |       |-- common.git
    |-- kernel
        |-- common.git


