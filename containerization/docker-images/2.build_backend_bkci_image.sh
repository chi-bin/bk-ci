#!/bin/bash
set -e
# 排除掉前端和agent两个大文件夹,缩小体积
cat << EOF > ./.dockerignore
./ci/frontend
EOF

echo "######################## BUILD BKCI BACKEND IMAGE START... ########################"
docker build -t mirrors.tencent.com/bkce/bkci-backend:$1 . -f ./dockerfile/backend.bkci.Dockerfile
docker push mirrors.tencent.com/bkce/bkci-backend:$1
echo "######################## BUILD BKCI BACKEND IMAGE FINISH ! ########################"
echo ''
rm -f ./.dockerignore