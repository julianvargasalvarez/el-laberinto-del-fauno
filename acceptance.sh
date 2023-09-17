echo 'Haciendo get al home'
curl -i -XGET 'http://localhost:4567/' -H 'x-player: nabuconodosor' -H 'x-current: af1'
echo ''

echo 'Haciendo get a una celda'
curl -i -XGET 'http://localhost:4567/cells/af1' -H 'x-player: nabuconodosor' -H 'x-current: af1'
echo ''

echo 'Haciendo post a la maleta'
curl -i -XPOST 'http://localhost:4567/maleta' -H 'x-player: nabuconodosor' -H 'x-current: af1' -d 'linterna'
echo ''

echo 'Haciendo get a la maleta'
curl -i -XGET 'http://localhost:4567/maleta' -H 'x-player: nabuconodosor' -H 'x-current: af1'
echo ''

echo 'Haciendo delete a la maleta'
curl -i -XDELETE 'http://localhost:4567/maleta/linterna' -H 'x-player: nabuconodosor' -H 'x-current: af1'
echo ''

echo 'Haciendo post al Fauno'
curl -i -XPOST 'http://localhost:4567/cells/af1' -H 'x-player: nabuconodosor' -H 'x-current: af1' -H 'Authorization: Basic a' -d'Dejame pasar'

