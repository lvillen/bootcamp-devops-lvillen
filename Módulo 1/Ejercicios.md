# Ejercicios CLI

## 1. Crea mediante comandos de bash la siguiente jerarquía de ficheros y directorios

```
mkdir -p foo/dummy foo/empty && echo "Me encanta la bash!!" > foo/dummy/file1.txt && touch foo/dummy/file2.txt
```

## 2. Mediante comandos de bash, vuelca el contenido de file1.txt a file2.txt y mueve file2.txt a la carpeta empty

```
cat foo/dummy/file1.txt > foo/dummy/file2.txt && mv foo/dummy/file2.txt foo/empty
```

## 3. Crear un script de bash que agrupe los pasos de los ejercicios anteriores y además permita establecer el texto de file1.txt alimentándose como parámetro al invocarlo

Tras `chmod +x ejercicio3.sh`, llamar al script con `./ejercicio3.sh` o `.ejercicio3.sh "Texto"`. 

## 4. Crea un script de bash que descargue el contenido de una página web a un fichero y busque en dicho fichero una palabra dada como parámetro al invocar el script

Tras `chmod +x ejercicio4.sh`, probar:
  - `./ejercicio4.sh`
  - `./ejercicio4.sh Tolkien`
  - `./ejercicio4.sh dog`

## 5. Modifica el ejercicio anterior de forma que la URL de la página web se pase por parámetro y también verifique que la llamada al script sea correcta

Tras `chmod +x ejercicio5.sh`, probar:
  - `./ejercicio5.sh https://es.wikipedia.org/wiki/Lorem_ipsum lorem`
  - `./ejercicio5.sh https://es.wikipedia.org/wiki/Lorem_ipsum laborum`
  - `./ejercicio5.sh https://es.wikipedia.org/wiki/Lorem_ipsum`
  - `./ejercicio5.sh https://es.wikipedia.org/wiki/Lorem_ipsum lorem ipsum`
