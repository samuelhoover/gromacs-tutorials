#!/bin/bash

# Short equilibration
gmx grompp -f npt_umbrella.mdp -c conf354.gro -r conf354.gro -p topol.top -n index.ndx -o npt354.tpr
gmx mdrun -deffnm npt354

# Umbrella run
gmx grompp -f md_umbrella.mdp -c npt354.gro -r npt354.gro -t npt354.cpt -p topol.top -n index.ndx -o umbrella354.tpr
gmx mdrun -deffnm umbrella354


