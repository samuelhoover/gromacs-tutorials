#!/bin/bash

# Short equilibration
gmx grompp -f npt_umbrella.mdp -c conf155.gro -r conf155.gro -p topol.top -n index.ndx -o npt155.tpr
gmx mdrun -deffnm npt155

# Umbrella run
gmx grompp -f md_umbrella.mdp -c npt155.gro -r npt155.gro -t npt155.cpt -p topol.top -n index.ndx -o umbrella155.tpr
gmx mdrun -deffnm umbrella155


