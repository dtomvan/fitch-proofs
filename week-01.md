# Chapter 1
## 1.4
Sentences 1.4
1. Cube(a)
2. Smaller(b,a)
3. Between(c,a,d)
4. Large(d)
5. Larger(e,a)
6. Tetra(b)
7. Dodec(e)
8. Right(e,b)
9. Smaller(a,e)
10. BackOf(d,a)
11. SameRow(b,d)
12. SameSize(b,c)

## 1.9

On Paper also

1. Owned(claire, folly, 2pm)
2. Gave(claire, pris, max, 2:05pm)
3. Student(max)
4. Fed(claire, carl, 2pm)
5. Owned(max, folly, 3:05pm)
6. 2:00pm < 2:05pm

## 1.11

World 1.11
- max: Max
- claire: Claire
- yesterday: yesterday
- aids: AIDS
- influenza: influenza
- spain: Spain
- france: France
- portugal: Portugal
- misery: misery
- company: company
- ShookHands(x,y): x shook hands with y
- ShookHandsAt(x,y,t): x shook hands with y at time t
- contagious(s): the contagiousness of sickness s
- Loves(a, b): a loves b
- Between(b, x, y): the size of b lies between the size of x and the size of y (though x might be greater than y)
- <: less than

Sentences 1.11
- ShookHands(max,claire)
- ShookHandsAt(max,claire,yesterday)
- contagious(aids) < contagious(influenza)
- Between(spain, france, portugal)
- Loves(misery, company)

## 1.12
1. The father of Claire is taller than the father of Max.
2. John is the father of Max.
3. Claire is taller than her grandmother.
4. Max's maternal grandmother is taller than Max's paternal grandmother.
5. Melanie and Claire share the same mother.

## 2.2

### 2.2.1

```
| Anyone who wins an academy award is famous
| Meryl Streep won an academy award.
|----
| Meryl Streep is famous.
```

This is valid but unsound, since one might become famous another way.

### 2.2.2

```
| Actors who win academy awards are famous
| Henry Ford has never won an academy award.
|----
| Harrison Ford is not famous
```

This is valid but unsound, since Henry Ford became famous for his car manufacturing.

### 2.2.3
```
| Charlton Heston said that the right to bear arms is the most important freedom.
| Charlton Heston is always right.
|----
| The right to bear arms is the most important freedom.
```

Valid but unsound, because CH might make a mistake sometimes.

### 2.2.4

```
| Al Gore is a politician.
| Politicians are dishonest.
|----
| Al Gore is dishonest.
```

Valid and sound, because of personal bias though. Since I believe there's no such thing as a politician with 100% integrity.

### 2.2.5

```
| Sam Clemens was born in Hannibal.
| Sam Clemens is Mark Twain.
|----
| Therefore, MT must've lived in Hannibal.
```

Valid and sound. If you're born somewhere, there must've been a time at which you've lived there at some point.

### 2.2.6

```
| This place was closed last night.
| You can't buy anything from a closed bar.
|----
| No one could've bought anything here last night.
| No one under 21 could've bought beer here last night.
```

### 2.2.7

```
| Claire lives on the same street as Max.
| Max lives on the same street as Laura.
|----
| Claire lives on the same street as Laura.
```

## 2.17

```
1 | SameCol(a,b)
2 | b=c
3 | c=d
  |----
4 | b=d                  = Elim: 2, 3
5 | SameCol(a,d)         = Elim: 1, 4
```

## 2.18

```
1 | Between(a,d,b)
2 | a=c
3 | e=b
  |----
4 | Between(c,d,b)         = Elim: 1, 2
5 | e=e                    = Intro
6 | b=e                    = Elim: 5, 3
7 | Between(c,d,e)         = Elim: 4, 6
```

## 2.22

This is invalid. My brother is a computer scientist, but he isn't rich (yet I guess).

