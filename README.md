# Functions to validate Chilean Rut:

## - Python

## - Javascript

## - SQL Stored Procedure for SQL Server

<br>

> ### Unique Roll Tributary
>
> ---
>
> Each person registered in the Civil Registry has their own RUT, a unique and unrepeatable number that serves as an identification method. This consists of an 8-digit number + a check digit that can go from 0 to 9 or a K.
>
> In Chile, the verification digit is unique for each RUT, it is calculated with a very simple algorithm, known as "module 11".
>
> ---


<br>

Let's look at the following example:

Imagine that my RUT is the following:

12.678.579-?

The numbers that make up the RUT are taken from right to left, and each digit is multiplied by the numbers that make up the numerical series 2, 3, 4, 5, 6, and 7. If the eighth number has been reached, reset the series to 2 again. For the example this would apply like this:

<br>

### 9 x 2 = 18

### 7 x 3 = 21

### 5 x 4 = 20

### 8 x 5 = 40

### 7 x 6 = 42

### 6 x 7 = 42

### 2 x 2 = 4

### 1 x 3 = 3

<br>

We add all the results and it gives us: 190

To this number we apply “modulo 11”, that is, what remains when dividing it by 11.

190 / 11 = 17.2727272727

Removing the decimal part.

17 x 11 = 187, and to get to 190 there are 3 missing

Finally, we subtract the previous result from 11: 11 – 3 = 8

The previous result corresponds to the check digit, unless the result is 11 the digit will be 0 and if it is 10 the digit will be K.

So our RUT would be: 12.678.579-8
