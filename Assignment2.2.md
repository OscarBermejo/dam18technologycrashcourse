# ASSIGNEMNT 2
##  STATISTICAL TEST

### ITALIA

La extracción de datos que hacemos es la siguiente:

* transaction_amount IS NOT NULL: solo queremos los valores que nos aporten información
* transaction_amount > 0: Solo nos interesa estudiar los 'Payments' ya que por cada 'Payment hay un 'Refund' (estaríamos duplicando información). Ademàs que hay un número muy similar de 'Refunds' en ambos países; 165 en Francia y 169 en Italia


En el siguiente gràfico tenemos todos los valores extraídos representados, vemos claramente que sobre una muestra de unos 3700 valores hay dos que destacan muy por encima de la media. El promedio es 211,4 mientras que los dos valores son 5016,5 y 8492,6.


![Caption for the picture.](transaction_amount_italia.png)

Por esto en el siguiente gràfico hemos extraído estos dos valores.


![Caption for the picture.](transaction_amount_italia_sinMAX.png)

A partir de estos datos hacemos un histograma de frecuencias. En el eje X tenemos los siguientes rangos:  0 - 99, 100 - 199, 200 - 299, 300 - 399... hasta 1200 - 1299. Y en el eje Y hay representados cuantos valores de nuestra muestra estan dentro de cada rango


![Caption for the picture.](italia.png)

### FRANCIA

Repetimos exactamente el mismo proceso para Francia


![Caption for the picture.](transaction_amount_francia.png)

![Caption for the picture.](transaction_amount_francia_sinMAX.png)

![Caption for the picture](francia.png)

![Caption for the picture.](italia.png)

Podemos ver facilmente como ambs histogramas de frecuencias son parecidos tanto en volúmen de datos como en la distribución de estos.

