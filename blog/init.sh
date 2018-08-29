#!/usr/bin/env bash


mkdir -p ~/opt/htdocs/
mkdir -p ~/opt/logs/
mkdir -p ~/opt/log/nginx/
mkdir -p ~/opt/log/php/

PROJECT_LIST=(
    'BLOG'
)

PROJECT_BLOG=(
    'https://github.com/xp329486175/blog'
    '/opt/htdocs/blog/'
)

initProject() {
    project_name=$1

    eval project_git=\${PROJECT_${project_name}[0]}
    eval project_path=\${PROJECT_${project_name}[1]}
    project_path=${HOME}${project_path}

    if [ ! -d "$project_path" ]; then
        echo "clone $project_git to $project_path"
        mkdir $project_path
        git clone $project_git $project_path
        else
        echo "$project_path is existed"
    fi
}
if [[ $1 = 'ALL' ]];
then
    for project_name in ${PROJECT_LIST[@]}
    do
        initProject $project_name
    done

elif [[ -n "$1" ]];
then
    initProject $1
else
    echo "current project lists [ ${PROJECT_LIST[@]} ]"
    echo "'sh init.sh ALL' to init all project"
    echo "'sh init.sh xx' to init specified project"
fi
