# For Daria

- `= Intro` and `= Elim`: 2.17, 2.18
- Disjunction elim: 6.4, 6.5, 6.6, 6.12, 6.12b
    - +impl: syllabus 4.3b
    - +bic: syllabus 4.3d
- Implication: syllabus 4.3, 8.26
- Bot/Neg: 6.9
- Bic Elim: 8.28
- Hard: 8.29, 8.30

# FitchVIZIER

These are exercises from FitchVIZIER.

## Negation

```
1  | S(a,b) ∧ ¬S(b,c)
2  | b=a
   |----
3  | S(a,b)                   ∧ Elim: 1
4  | ¬S(b,c)                  ∧ Elim: 1
5  | b=b                      = Intro
6  | a=b                      = Elim: 5, 2
7  | | b=c
   | |----
8  | | S(b,b)                 = Elim: 3, 6
9  | | S(b,c)                 = Elim: 8, 7
10 | | ⊥                      ⊥ Intro: 9, 4
11 | ¬(b=c)                   ¬ Intro: 7-10
```

## Implication

```
1 | (P ∨ Q) → (R ∧ S)
  |----
2 | | P ∧ Q
  | |----
3 | | P                       ∧ Elim: 2
4 | | P ∨ Q                   ∨ Intro: 3
5 | | R ∧ S                   → Elim: 1,4
6 | | R                       ∧ Elim: 5
7 | | R ∨ S                   ∨ Intro: 6
8 | (P ∧ Q) → (R ∨ S)         → Intro: 2-7
```

```
1  | (A → B) ∨ ((B → C) → C)
2  | A ∧ ¬B
   |----
3  | A                               ∧ Elim: 2
4  | ¬B                              ∧ Elim: 2
5  | | A → B
   | |----
6  | | B                             → Elim: 5,3
7  | | ⊥                             ⊥ Intro: 6, 4
8  | | C                             ⊥ Elim: 7
   |
9  | | (B → C) → C
   | |----
10 | | | B
   | | |----
11 | | | ⊥                           ⊥ Intro: 10, 4
12 | | | C                           ⊥ Elim: 11
13 | | B → C                         → Intro: 10-12
14 | | C                             → Elim: 9,13
15 | C                               ∨ Elim: 1, 5-8, 9-14
```

```
1  | (P ∨ Q) ∧ R
2  | ¬Q
   |----
3  | P ∨ Q               ∧ Elim: 1
4  | | R
   | |----
5  | | | ¬P
   | | |----
6  | | | | P
   | | | |----
7  | | | | ⊥             ⊥ Intro: 6, 5
   | | |
8  | | | | Q
   | | | |----
9  | | | | ⊥             ⊥ Intro: 8, 2
10 | | | ⊥               ∨ Elim: 3, 6-7, 8-9
11 | | ¬¬P               ¬ Intro: 5-10
12 | | P                 ¬ Elim: 11
13 | R → P               → Intro: 4-12
14 | R                   ∧ Elim: 1
15 | P                   → Elim: 13,14
```

## For-all

```
  |----
1 | | [c]
  | |----
2 | | c=c            = Intro
3 | ∀x (x=x)         ∀ Intro: 1-2
```
