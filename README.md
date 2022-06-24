# Swift Computational-Chem
---
## The aim of this project

In this project, I aim to create a computational means to simulate any chemical reaction taking into account external factors such as temperature,
pressure and concentration allowing for a complete evaluation of the reaction. The main language of choice is swift mainly for its relative ease of development
and speed from being a compiled language. In addition it can be ported to iOS and MacOS to make it a powerful tool in learning and virtualising experiments.
---
## Features
Features of the software so far:
- Using brownian motion to model the movement of a particle
- The ability to simulate and track the movement of multiple particles on a "Frame-by-Frame" basis
- Exporting the relavent information of each "Frame" in the simulation such as:
  - Each particle position
  - Timestamp
  - Each particles' respective velocity
- Initial chemical formulae interpreter (Beta)
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
