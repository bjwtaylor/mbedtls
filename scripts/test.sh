#!/bin/bash

rm -rf results.txt

#test 1 mbedtls in tree build
echo "Running test 1" 
rm -rf mbedtls.move-lcov.test1
cp -r mbedtls.move-lcov mbedtls.move-lcov.test1
cd mbedtls.move-lcov.test1
cmake -D CMAKE_BUILD_TYPE=Coverage . && make
make test
./framework/scripts/lcov.sh &> lcov.log 
echo "test 1 result" >> ../results.txt
if grep -q "ERROR" "lcov.log";then
    echo "fail" >> ../results.txt
else 
    touch Coverage/index.html && echo "pass" >> ../results.txt || echo "fail" >> ../results.txt
fi
cd ../

echo "Running test 2" 
#test 2 mbedtls out of tree in dir build
rm -rf mbedtls.move-lcov.test2
cp -r mbedtls.move-lcov mbedtls.move-lcov.test2
cd mbedtls.move-lcov.test2
mkdir build-coverage
cd build-coverage
cmake -D CMAKE_BUILD_TYPE=Coverage ..
make
make test
../framework/scripts/lcov.sh &> lcov.log 
echo "test 2 result" >> ../../results.txt
if grep -q "ERROR" "lcov.log";then
    echo "fail" >> ../../results.txt
else 
    touch Coverage/index.html && echo "pass" >> ../../results.txt || echo "fail" >> ../../results.txt
fi
cd ../../

echo "Running test 3" 
#test 3 out of tree and out of dir build
rm -rf mbedtls_build.move-lcov.test3
mkdir mbedtls_build.move-lcov.test3
cd mbedtls_build.move-lcov.test3
cmake -D CMAKE_BUILD_TYPE=Coverage ../mbedtls.move-lcov/ && make
make test
../mbedtls.move-lcov/framework/scripts/lcov.sh &> lcov.log 
echo "test 3 result" >> ../results.txt
if grep -q "ERROR" "lcov.log";then
    echo "fail" >> ../results.txt
else 
    touch Coverage/index.html && echo "pass" >> ../results.txt || echo "fail" >> ../results.txt
fi
cd ../

#TF-PSA-CRYPTO tests
echo "Running test 4" 
#test 4 tf-psa-crypto in tree build
rm -rf tf-psa-crypto.move-lcov.test4
cp -r mbedtls.move-lcov/tf-psa-crypto tf-psa-crypto.move-lcov.test4
cd tf-psa-crypto.move-lcov.test4
cmake -D CMAKE_BUILD_TYPE=Coverage . && make
make test
./framework/scripts/lcov.sh &> lcov.log 
echo "test 4 result" >> ../results.txt
if grep -q "ERROR" "lcov.log";then
    echo "fail" >> ../results.txt
else 
    touch Coverage/index.html && echo "pass" >> ../results.txt || echo "fail" >> ../results.txt
fi
cd ../

echo "Running test 5" 
#test 5 tf-psa-crypto out of tree in dir build
rm -rf tf-psa-crypto.move-lcov.test5
cp -r mbedtls.move-lcov/tf-psa-crypto tf-psa-crypto.move-lcov.test5
cd tf-psa-crypto.move-lcov.test5
mkdir build-coverage
cd build-coverage
cmake -D CMAKE_BUILD_TYPE=Coverage ..
make
make test
../framework/scripts/lcov.sh &> lcov.log 
echo "test 5 result" >> ../../results.txt
if grep -q "ERROR" "lcov.log";then
    echo "fail" >> ../../results.txt
else 
    touch Coverage/index.html && echo "pass" >> ../../results.txt || echo "fail" >> ../../results.txt
fi
cd ../../

echo "Running test 6" 
#test 6 out of tree and out of dir build
rm -rf tf-psa-crypto_build.move-lcov.test6
mkdir tf-psa-crypto_build.move-lcov.test6
cd tf-psa-crypto_build.move-lcov.test6
cmake -D CMAKE_BUILD_TYPE=Coverage ../mbedtls.move-lcov/tf-psa-crypto && make
make test
../mbedtls.move-lcov/framework/scripts/lcov.sh &> lcov.log 
echo "test 6 result" >> ../results.txt
if grep -q "ERROR" "lcov.log";then
    echo "fail" >> ../results.txt
else 
    touch Coverage/index.html && echo "pass" >> ../results.txt || echo "fail" >> ../results.txt
fi
cd ../

#3.6 tests
echo "Running test 7" 
#test 7 mbedtls 3.6 in tree build
rm -rf mbedtls.move-lcov-3.6.test7
cp -r mbedtls.move-lcov-3.6 mbedtls.move-lcov-3.6.test7
cd mbedtls.move-lcov-3.6.test7
cmake -D CMAKE_BUILD_TYPE=Coverage . && make
make test
./framework/scripts/lcov.sh &> lcov.log 
echo "test 7 result" >> ../results.txt
if grep -q "ERROR" "lcov.log";then
    echo "fail" >> ../results.txt
else 
    touch Coverage/index.html && echo "pass" >> ../results.txt || echo "fail" >> ../results.txt
fi
cd ../

echo "Running test 8" 
#test 8 mbedtls 3.6 out of tree in dir build
rm -rf mbedtls.move-lcov-3.6.test8
cp -r mbedtls.move-lcov-3.6 mbedtls.move-lcov-3.6.test8
cd mbedtls.move-lcov-3.6.test8
mkdir build-coverage
cd build-coverage
cmake -D CMAKE_BUILD_TYPE=Coverage ..
make
make test
../framework/scripts/lcov.sh &> lcov.log 
echo "test 8 result" >> ../../results.txt
if grep -q "ERROR" "lcov.log";then
    echo "fail" >> ../../results.txt
else 
    touch Coverage/index.html && echo "pass" >> ../../results.txt || echo "fail" >> ../../results.txt
fi
cd ../../

echo "Running test 9" 
#test 9 out of tree and out of dir build
rm -rf mbedtls_build.move-lcov-3.6.test9
mkdir mbedtls_build.move-lcov-3.6.test9
cd mbedtls_build.move-lcov-3.6.test9
cmake -D CMAKE_BUILD_TYPE=Coverage ../mbedtls.move-lcov-3.6/ && make
make test
../mbedtls.move-lcov/framework/scripts/lcov.sh &> lcov.log 
echo "test 9 result" >> ../results.txt
if grep -q "ERROR" "lcov.log";then
    echo "fail" >> ../results.txt
else 
    touch Coverage/index.html && echo "pass" >> ../results.txt || echo "fail" >> ../results.txt
fi
cd ../
