#!/bin/bash
# 放在 repositories 目录下，用于创建单个服务端的 repository.

mkdir -p $1
cd $1
git init --bare

