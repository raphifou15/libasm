# libasm

## Introduction

Le but de ce projet est de se familiariser avec le langage assembleur (ASM) en créant une bibliothèque de diverses fonctions écrites en assembleur 64 bits.

## Objectif

- Écrire des fonctions en assembleur 64 bits en utilisant la syntaxe Intel.
- Assurer le respect de la convention d'appel (calling convention).
- Compiler le code assembleur avec nasm.
- Éviter l'utilisation d'ASM inline en favorisant des fichiers .s.
- Vérifier et gérer correctement les erreurs lors des appels système (syscalls).

## Fonctions à implémenter en ASM

- ft_strlen (référence : man 3 strlen)
- ft_strcpy (référence : man 3 strcpy)
- ft_strcmp (référence : man 3 strcmp)
- ft_write (référence : man 2 write)
- ft_read (référence : man 2 read)
- ft_strdup (référence : man 3 strdup, vous pouvez appeler malloc)

## Fonctions bonus à implémenter en ASM

- ft_atoi_base (atoi avec la base qui peut changer)
- ft_list_push_front (rajoute un élément au début d'une liste chaînée)
- ft_list_size (calcul la taille de la liste chaînée)
- ft_list_sort (met en ordre la liste chaînée)
- ft_list_remove_if (efface un élément de la liste chaînée ainsi qu'un élément malloc à l'intérieur de celui-ci)

## Documentation

[x86-64 Assembly Language Programming with Ubuntu](https://github.com/raphifou15/libasm/blob/main/assembly64.pdf)

[Le modèle d'architecture de von Neumann](https://interstices.info/le-modele-darchitecture-de-von-neumann/)

[What Is Little-Endian And Big-Endian Byte Ordering?](<https://www.section.io/engineering-education/what-is-little-endian-and-big-endian/#:~:text=Specifically%2C%20little%2Dendian%20is%20when,first%20(the%2012%20part).>)

[Voici la liste des instructions reconnus par le x86-64 :](https://www.gladir.com/CODER/ASM8086/x86-64.htm)

## Comment utiliser libasm

### Cloner le projet

```
git clone git@github.com:raphifou15/libasm.git libasm
```

### Compiler la libasm et la partie bonus

```
make
make bonus
```

### Faire fonctionner les main de test et les lancer

```
gcc main.c -L. libasm.a
./a.out ft_strlen

gcc main_bonus.c -L. libasm.a
./a.out ft_list_push_front
```

### L'utiliser dans son script

- Incluez le code ci-dessous dans votre main pour pouvoir utiliser les fonctions. Puis lancez votre fichier .c en liant la bibliothèque.

```
#include "libasm.h"
```

```
gcc fichier.c -L. libasm.a
```
