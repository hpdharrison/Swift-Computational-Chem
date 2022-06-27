# Swift Computational-Chem
---
## The aim of this project

In this project, I aim to create a computational means to simulate any chemical reaction taking into account external factors such as temperature,
pressure and concentration allowing for a complete evaluation of the reaction.
---
## Why swift?

Swift is a modern compiled language which is very fast and easy to develop. Swift, being the replacment for Obj-C, is natively compatible on any iOS and MacOS device. This will allow the tool to expand and perhaps be a powerful tool in learning the fundamental ideas in chemistry as well as simulating more complex reactions to safely predict what may happen in a physical lab experiment.
---
## Features
Features of the software so far:
- Using brownian motion to model the movement of a particle
- The ability to simulate and track the movement of multiple particles on a "Frame-by-Frame" basis
- Exporting the relavent information of each "Frame" in the simulation such as:
  - Each particle position
  - Timestamp
  - Each particles' respective velocity
- Natural chemical formulae interpreter
  - Moles of each molecule grouped by reactants and products
  - Molecule breakdown in tuples stating the quantity of each atom in a molecule
---
## Future additions
As an on going project I hope to add (not limited to) some of the following features
- Collision detection in accordance with the "Collision theory" of reaction
- Compatability for reversible reactions
- Compatability with "le Chateliers Principle"
- Using the Arherrius equation to model the probability of a reacting collision
- Intuitive GUI
- Cross compatability with iOS
- Optional support for modelling in 3D Space
- Exporting graphical representations for such data as "Particle path", "Enthalpy Changes" e.t.c
## Run
To compile and run, use the swift compiler for the command line based modules
