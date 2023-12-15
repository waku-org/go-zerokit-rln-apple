This project is used in https://github.com/waku-org/go-zerokit-rln to bypass the 500mb limit for go modules


# How to build
```
git clone https://github.com/waku-org/go-zerokit-rln_apple
cd go-zerokit-rln_apple
git submodule init
git submodule update --recursive
make
```

# Updating zerokit
```bash
export ZEROKIT_COMMIT=master    # Use a commit, branch or tag
cd zerokit
git pull
git checkout ${ZEROKIT_COMMIT}
cd ..
make
git add zerokit
git add libs/*/librln.a
git commit -m "chore: bump zerokit"
git push
```
