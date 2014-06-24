#!/usr/bin/env bash

pushd "$HOME/od4d/fuseki"

URL=http://localhost:3030/articles

./s-put $URL/data default Data/books.ttl

./s-query --service $URL/query 'SELECT * {?s ?p ?o}'

./s-update --service $URL/update 'CLEAR DEFAULT'

./s-query --service $URL/query 'SELECT * {?s ?p ?o}'

popd
