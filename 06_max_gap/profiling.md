### Specifics of Languages

| Lang  |                                  Source / Version                                   |
| :---: | :---------------------------------------------------------------------------------: |
|  APL  |                                   Dyalog APL 18.2                                   |
|  BQN  | [CBQN](https://github.com/dzaima/CBQN) built with `make o3n-singeli CC=cc REPLXX=1` |
|   J   |                                        J9.4                                         |
|   Q   |                     KDB+ 4.0 2022.10.26 run with `taskset -c 2`                     |

### Profiling (Sort + Deltas + Max)

| Lang  |                      Command                       |
| :---: | :------------------------------------------------: |
| BQN 2 | `10 {⌈´(1⊸↓-¯1⊸↓)∧𝕩} •_timed 1e7 •rand.Range 1e7`  |
|   J   |    `10 (6!:2) '{{ >./ 2-~/\ /:~ y }} ?1e7#1e7'`    |
| APL 2 | `]runtime -repeat=10 '{⌈/2-/{(⊂⍒⍵)⌷⍵}⍵} ?1e7⍴1e7'` |
| BQN 1 |    `10 {⌈´-´˘2↕∨𝕩} •_timed 1e7 •rand.Range 1e7`    |
|  APL  |  `]runtime -repeat=10 '{⌈/2-/(⊂⍤⍒⌷⊢)⍵} ?1e7⍴1e7'`  |
|   Q   | `\ts:10 { max 1 _ deltas asc x } (7h$1e7)?7h$1e7 ` |

|      Lang       |     Sort     | Sort + Deltas |     Full     | Full + Rand |
| :-------------: | :----------: | :-----------: | :----------: | :---------: |
| CUDA (Thrust 2) |              |               |   0.007143   |             |
| CUDA (Thrust 1) |              |               |   0.008413   |             |
|      BQN 2      | 0.1058985824 | 0.1059849112  | 0.1100821086 |      -      |
|        J        |   0.120776   |   0.135354    |   0.139736   |  0.213386   |
|      APL 2      |    .1437     |     .1453     |    .1515     |             |
|      BQN 1      | 0.1017272612 | 0.3206097638  | 0.3267318615 |      -      |
|       APL       |     .389     |     .3906     |    0.3954    |   0.5625    |
|        Q        |     .52      |    0.5593     |    0.5776    |   0.6821    |

![image](https://user-images.githubusercontent.com/36027403/225428310-b776d6b5-4949-41e8-87f3-3966445f52c7.png)

### Profiling (Deltas + Max)

| Lang  |                     Command                      |
| :---: | :----------------------------------------------: |
|  BQN  | `10 {⌈´(1⊸↓-¯1⊸↓)𝕩} •_timed 1e8 •rand.Range 1e8` |
|   J   |     `10 (6!:2) '{{ >./ 2-~/\ y }} ?1e8#1e8'`     |
|  APL  |    `]runtime -repeat=10 '{⌈/2-/⍵} ?1e8⍴1e8'`     |
|   Q   |  `\ts:10 { max 1 _ deltas x } (7h$1e8)?7h$1e8`   |

|      Lang       |    Deltas    | Deltas + Max |
| :-------------: | :----------: | :----------: |
| CUDA (Thrust 2) |              |   0.001864   |
| CUDA (Thrust 1) |              |   0.017094   |
|       BQN       | 0.0317558118 | 0.0531495085 |
|       APL       |    0.0344    |    0.0578    |
|        J        |   0.145835   |   0.187187   |
|        Q        |    .2017     |    .3282     |

![image](https://user-images.githubusercontent.com/36027403/225417145-395c9c55-5470-4efd-a846-95a2ccaee32d.png)

| Lang  |   1e5    |   1e6    |   1e7   |   1e8    |
| :---: | :------: | :------: | :-----: | :------: |
|  BQN  | 0.000019 | 0.000199 | 0.00492 | 0.049014 |
|  APL  | 0.000047 | 0.000407 | 0.00626 |  0.0562  |
|   J   | 0.000195 | 0.00166  | 0.01801 | .182956  |
|   Q   | 0.000105 |  0.0025  | 0.0316  |  0.2252  |

![image](https://user-images.githubusercontent.com/36027403/225056435-95ad50ac-3022-4416-8e2e-129c4718c44b.png)
