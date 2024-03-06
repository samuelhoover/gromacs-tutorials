# Notes on performing atomistic simulations in GROMACS

## Equilibrating
Generally, 10 ns is a good starting point for an equilibration run.

## Thermostats and barostats
Berendsen thermostat and barostat should *not* be used for production runs ([source for thermostat](https://manual.gromacs.org/current/reference-manual/algorithms/molecular-dynamics.html#berendsen-temperature-coupling), [source for barostat](https://manual.gromacs.org/current/reference-manual/algorithms/molecular-dynamics.html#berendsen-pressure-coupling)). Additional caution should be taken when used for equilibration to ensure the system has actually reached equilibrium. With more complex or unstable systems, it is advised to switch to another thermostat and barostat after reaching the desired temperature or pressure to ensure stability.

The Parrinello-Rahman barostat is prone to large pressure swings in systems that are not sufficiently equilibrated. Use the Berendsen barostat first, then switch to the Parrinello-Rahman barostat afterwards [(source)](https://gromacs.bioexcel.eu/t/pressure-scaling-more-than-1/2072/2). One GROMACS developer advises against using the Parrinello-Rahman barostat during equilibration [(source)](https://gromacs.bioexcel.eu/t/changes-of-default-nstpcouple-and-nsttcouple-from-version-2022-to-2023/6220/17).

It is now generally recommended to use the `v-rescale` thermostat and the `c-rescale` barostat for equilibration and productions runs [(source)](https://gromacs.bioexcel.eu/t/what-is-the-recommended-value-for-tau-p-and-tau-t-with-gromacs2023-0-when-using-pr-and-nh/5840/2). Otherwise, use the Nos&#233;-Hoover thermostat and the Parrinello-Rahman barostat. Both thermostats produce valid canonical ensembles [(source)](https://gromacs.bioexcel.eu/t/choice-of-thermostat-during-production-md-nose-hoover-vs-v-rescale/1420/2).

Do not separate thermostats for every component in your system, generally best to separate solvent from solute. For protein separations, using `tc-grps = Protein Non-Protein` is usually best [(source)](https://manual.gromacs.org/current/user-guide/terminology.html#gmx-thermostats-dont).

## Parameters
$\tau_{t}$ for the thermostat needs to be sufficiently small enough to remove energy drift from integration and truncation errors. $\tau_{p}$ for the barostat should not be too small as to scale the simulation box volume too quickly and cause instabilities. Advised to use $\tau_{t}$ = 1 ps and $\tau_{p}$ = 5 ps for the `v-rescale` thermostat and the `c-rescale` barostat, respectively [(source)](https://gromacs.bioexcel.eu/t/what-is-the-recommended-value-for-tau-p-and-tau-t-with-gromacs2023-0-when-using-pr-and-nh/5840/4).
