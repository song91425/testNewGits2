#!/bin/bash
# sh uploadToGit.sh "提交信息" 
# 默认值
DEFAULT_REMOTE_URL="git@github.com:song91425/testNewGits2.git"  # 替换为默认远程仓库 URL
DEFAULT_BRANCH_NAME="main"  # 替换为默认分支名
DEFAULT_ORIGIN_NAME="target"  # 替换为默认远端仓库名
COMMIT=$1

REMOTE_NAME=${2:-$DEFAULT_ORIGIN_NAME}
# 从参数获取值，参数为空则使用默认值
REMOTE_URL=${3:-$DEFAULT_REMOTE_URL}
BRANCH_NAME=${4:-$DEFAULT_BRANCH_NAME}

# 检查远程仓库是否存在
if git remote get-url $REMOTE_NAME &>/dev/null; then
    echo "远程仓库 '$REMOTE_NAME' 已存在。"
else
    echo "远程仓库 '$REMOTE_NAME' 不存在，正在添加..."
    git remote add $REMOTE_NAME $REMOTE_URL
    echo "远程仓库 '$REMOTE_NAME' 已添加。"
fi

# 切换到目标分支
git checkout $BRANCH_NAME

# 添加更改
git add .

# 提交更改
git commit -m $COMMIT

# 推送到指定的远程仓库
git push $REMOTE_NAME $BRANCH_NAME

echo "已成功推送到远程仓库 '$REMOTE_NAME' 的 '$BRANCH_NAME' 分支。"
# push an existing repository from the command line
# git remote add origin git@github.com:song91425/testGits.git
# git branch -M main
# git push -u origin main