#!/bin/bash

# Short equilibration
gmx grompp -f npt_umbrella.mdp -c conf218.gro -r conf218.gro -p topol.top -n index.ndx -o npt218.tpr
gmx mdrun -deffnm npt218

# Umbrella run
gmx grompp -f md_umbrella.mdp -c npt218.gro -r npt218.gro -t npt218.cpt -p topol.top -n index.ndx -o umbrella218.tpr
gmx mdrun -deffnm umbrella218


