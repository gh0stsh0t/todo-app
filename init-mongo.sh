#!/usr/bin/env bash
set -eu
mongo -- "$MONGO_DB" <<EOF
    var rootUser = 'root'
    var rootPassword = 'rootpassword'
    var admin = db.getSiblingDB('admin');
    admin.auth(rootUser, rootPassword);

    var user = 'user'
    var passwd = 'pass'
    db.createUser({user: user, pwd: passwd, roles: ["readWrite"]});
EOF