# Family Tree in Prolog

## Overview
This project is a **Prolog-based family tree program** that demonstrates logical inference and recursion.  
It defines basic relationships (parent, male, female) and builds derived ones such as **grandparent**, **sibling**, **cousin**, and **ancestor/descendant**.  
The goal is to show how Prolog can model family structures and answer relationship queries.

---

## Features
- **Basic facts**: parent/2, male/1, female/1  
- **Derived relationships**:
  - child/2
  - father/2, mother/2
  - sibling/2, brother/2, sister/2
  - grandparent/2, grandchild/2
  - cousin/2
- **Recursive logic**:
  - ancestor/2
  - descendant/2
- **Helper predicates** for easier querying:
  - children/2
  - siblings_of/2
  - cousins_of/2
  - descendants/2
  - grandparents_of/2

---

## Setup

### Install SWI-Prolog
- **macOS (Homebrew):**
  ```bash
  brew install swi-prolog
````

* **Ubuntu/Debian:**

  ```bash
  sudo apt-get update
  sudo apt-get install swi-prolog
  ```
* **Windows:**
  Download installer from [SWI-Prolog Download](https://www.swi-prolog.org/Download.html)

Verify installation:

```bash
swipl --version
```

---

## Running the Program

1. Open terminal in project folder.
2. Start Prolog:

   ```bash
   swipl
   ```
3. Load the program:

   ```prolog
   ?- [family_tree].
   ```

---

## Sample Queries

```prolog
% Who are the children of alice?
?- children(alice, Cs).
% Expected: Cs = [diana, ethan].

% Who are john’s grandchildren?
?- findall(GC, grandchild(GC, john), L), sort(L, GCs).
% Expected: GCs = [diana, ethan, george, helen].

% Siblings of bob?
?- siblings_of(bob, Ss).
% Expected: Ss = [alice].

% Is diana a cousin of george?
?- cousin(diana, george).
% Expected: true.

% All descendants of susan
?- descendants(susan, Ds).
% Expected: Ds = [alice, bob, diana, ethan, george, helen].
```

---

## Folder Structure

```
Prolog/
├── family_tree.pl      # Prolog facts and rules
├── README.md           # This file
└── sample_queries.txt  # Optional: contains example queries + expected output
```
