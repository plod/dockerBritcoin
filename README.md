# dockerBritcoin
dockerize a britcoin compile for linux (xcompiling to follow)

depends on docker (of course!), libqrencode3, libdb5.3++, libboost1.58-all-dev (prob overkill but not sure which package needed) [maybe others that are in standard xubuntu install]

run by cloning the repository and running ./britcoin.sh (first time it'll compile and just runs wallet client on subsequent invocations [unless you delete the compiled binary])
