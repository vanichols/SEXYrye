
# SEXYrye

<!-- badges: start -->
<!-- badges: end -->

The goal of SEXYrye is to provide transparency in data cleaning, and to
make the data from the SEXY Rye trial easily accessible and shareable.

## Installation

You can install the development version of SEXYrye from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("vanichols/SEXYrye")
```

## Example

This is a basic example of the type of data contained in this package.
It’s easy to pull up, just type sexy… and it will provide suggestions of
the available data you might want to pull up.

``` r
library(SEXYrye)

sexy1_eukey
#>    trial_id    eu_id eu2_id block_id plot_id plothalf_id plot_idtim croptrt_id
#> 1    Trial1 b1_101_n b1_101       b1     101           n       101a          p
#> 2    Trial1 b1_101_s b1_101       b1     101           s       101b          p
#> 3    Trial1 b1_102_n b1_102       b1     102           n       102a    xaprows
#> 4    Trial1 b1_102_s b1_102       b1     102           s       102b    xaprows
#> 5    Trial1 b1_103_n b1_103       b1     103           n       103a        pcc
#> 6    Trial1 b1_103_s b1_103       b1     103           s       103b        pcc
#> 7    Trial1 b1_104_n b1_104       b1     104           n       104a         xa
#> 8    Trial1 b1_104_s b1_104       b1     104           s       104b         xa
#> 9    Trial1 b1_105_n b1_105       b1     105           n       105a          a
#> 10   Trial1 b1_105_s b1_105       b1     105           s       105b          a
#> 11   Trial1 b1_106_n b1_106       b1     106           n       106a     aprows
#> 12   Trial1 b1_106_s b1_106       b1     106           s       106b     aprows
#> 13   Trial1 b1_107_n b1_107       b1     107           n       107a       xacc
#> 14   Trial1 b1_107_s b1_107       b1     107           s       107b       xacc
#> 15   Trial1 b1_108_n b1_108       b1     108           n       108a     xapmix
#> 16   Trial1 b1_108_s b1_108       b1     108           s       108b     xapmix
#> 17   Trial1 b1_109_n b1_109       b1     109           n       109a      apmix
#> 18   Trial1 b1_109_s b1_109       b1     109           s       109b      apmix
#> 19   Trial1 b1_110_n b1_110       b1     110           n       110a        acc
#> 20   Trial1 b1_110_s b1_110       b1     110           s       110b        acc
#> 21   Trial1 b1_111_n b1_111       b1     111           n       111a         xp
#> 22   Trial1 b1_111_s b1_111       b1     111           s       111b         xp
#> 23   Trial1 b1_112_n b1_112       b1     112           n       112a       xpcc
#> 24   Trial1 b1_112_s b1_112       b1     112           s       112b       xpcc
#> 25   Trial1 b2_201_n b2_201       b2     201           n       201a      apmix
#> 26   Trial1 b2_201_s b2_201       b2     201           s       201b      apmix
#> 27   Trial1 b2_202_n b2_202       b2     202           n       202a          a
#> 28   Trial1 b2_202_s b2_202       b2     202           s       202b          a
#> 29   Trial1 b2_203_n b2_203       b2     203           n       203a    xaprows
#> 30   Trial1 b2_203_s b2_203       b2     203           s       203b    xaprows
#> 31   Trial1 b2_204_n b2_204       b2     204           n       204a       xacc
#> 32   Trial1 b2_204_s b2_204       b2     204           s       204b       xacc
#> 33   Trial1 b2_205_n b2_205       b2     205           n       205a        pcc
#> 34   Trial1 b2_205_s b2_205       b2     205           s       205b        pcc
#> 35   Trial1 b2_206_n b2_206       b2     206           n       206a     xapmix
#> 36   Trial1 b2_206_s b2_206       b2     206           s       206b     xapmix
#> 37   Trial1 b2_207_n b2_207       b2     207           n       207a         xp
#> 38   Trial1 b2_207_s b2_207       b2     207           s       207b         xp
#> 39   Trial1 b2_208_n b2_208       b2     208           n       208a        acc
#> 40   Trial1 b2_208_s b2_208       b2     208           s       208b        acc
#> 41   Trial1 b2_209_n b2_209       b2     209           n       209a          p
#> 42   Trial1 b2_209_s b2_209       b2     209           s       209b          p
#> 43   Trial1 b2_210_n b2_210       b2     210           n       210a       xpcc
#> 44   Trial1 b2_210_s b2_210       b2     210           s       210b       xpcc
#> 45   Trial1 b2_211_n b2_211       b2     211           n       211a         xa
#> 46   Trial1 b2_211_s b2_211       b2     211           s       211b         xa
#> 47   Trial1 b2_212_n b2_212       b2     212           n       212a     aprows
#> 48   Trial1 b2_212_s b2_212       b2     212           s       212b     aprows
#> 49   Trial1 b3_301_n b3_301       b3     301           n       301a     aprows
#> 50   Trial1 b3_301_s b3_301       b3     301           s       301b     aprows
#> 51   Trial1 b3_302_n b3_302       b3     302           n       302a        acc
#> 52   Trial1 b3_302_s b3_302       b3     302           s       302b        acc
#> 53   Trial1 b3_303_n b3_303       b3     303           n       303a         xp
#> 54   Trial1 b3_303_s b3_303       b3     303           s       303b         xp
#> 55   Trial1 b3_304_n b3_304       b3     304           n       304a       xpcc
#> 56   Trial1 b3_304_s b3_304       b3     304           s       304b       xpcc
#> 57   Trial1 b3_305_n b3_305       b3     305           n       305a        pcc
#> 58   Trial1 b3_305_s b3_305       b3     305           s       305b        pcc
#> 59   Trial1 b3_306_n b3_306       b3     306           n       306a         xa
#> 60   Trial1 b3_306_s b3_306       b3     306           s       306b         xa
#> 61   Trial1 b3_307_n b3_307       b3     307           n       307a          a
#> 62   Trial1 b3_307_s b3_307       b3     307           s       307b          a
#> 63   Trial1 b3_308_n b3_308       b3     308           n       308a     xapmix
#> 64   Trial1 b3_308_s b3_308       b3     308           s       308b     xapmix
#> 65   Trial1 b3_309_n b3_309       b3     309           n       309a       xacc
#> 66   Trial1 b3_309_s b3_309       b3     309           s       309b       xacc
#> 67   Trial1 b3_310_n b3_310       b3     310           n       310a      apmix
#> 68   Trial1 b3_310_s b3_310       b3     310           s       310b      apmix
#> 69   Trial1 b3_311_n b3_311       b3     311           n       311a          p
#> 70   Trial1 b3_311_s b3_311       b3     311           s       311b          p
#> 71   Trial1 b3_312_n b3_312       b3     312           n       312a    xaprows
#> 72   Trial1 b3_312_s b3_312       b3     312           s       312b    xaprows
#> 73   Trial1 b4_401_n b4_401       b4     401           n       401a    xaprows
#> 74   Trial1 b4_401_s b4_401       b4     401           s       401b    xaprows
#> 75   Trial1 b4_402_n b4_402       b4     402           n       402a      apmix
#> 76   Trial1 b4_402_s b4_402       b4     402           s       402b      apmix
#> 77   Trial1 b4_403_n b4_403       b4     403           n       403a       xacc
#> 78   Trial1 b4_403_s b4_403       b4     403           s       403b       xacc
#> 79   Trial1 b4_404_n b4_404       b4     404           n       404a        acc
#> 80   Trial1 b4_404_s b4_404       b4     404           s       404b        acc
#> 81   Trial1 b4_405_n b4_405       b4     405           n       405a          p
#> 82   Trial1 b4_405_s b4_405       b4     405           s       405b          p
#> 83   Trial1 b4_406_n b4_406       b4     406           n       406a       xpcc
#> 84   Trial1 b4_406_s b4_406       b4     406           s       406b       xpcc
#> 85   Trial1 b4_407_n b4_407       b4     407           n       407a         xa
#> 86   Trial1 b4_407_s b4_407       b4     407           s       407b         xa
#> 87   Trial1 b4_408_n b4_408       b4     408           n       408a        pcc
#> 88   Trial1 b4_408_s b4_408       b4     408           s       408b        pcc
#> 89   Trial1 b4_409_n b4_409       b4     409           n       409a         xp
#> 90   Trial1 b4_409_s b4_409       b4     409           s       409b         xp
#> 91   Trial1 b4_410_n b4_410       b4     410           n       410a     aprows
#> 92   Trial1 b4_410_s b4_410       b4     410           s       410b     aprows
#> 93   Trial1 b4_411_n b4_411       b4     411           n       411a     xapmix
#> 94   Trial1 b4_411_s b4_411       b4     411           s       411b     xapmix
#> 95   Trial1 b4_412_n b4_412       b4     412           n       412a          a
#> 96   Trial1 b4_412_s b4_412       b4     412           s       412b          a
#>    weedctl_id crop_cat
#> 1        herb   perenn
#> 2        herb   perenn
#> 3        none      mix
#> 4        none      mix
#> 5        herb   perenn
#> 6        herb   perenn
#> 7        none      ann
#> 8        none      ann
#> 9        herb      ann
#> 10       herb      ann
#> 11       herb      mix
#> 12       herb      mix
#> 13       none      ann
#> 14       none      ann
#> 15       none      mix
#> 16       none      mix
#> 17       herb      mix
#> 18       herb      mix
#> 19       herb      ann
#> 20       herb      ann
#> 21       none   perenn
#> 22       none   perenn
#> 23       none   perenn
#> 24       none   perenn
#> 25       herb      mix
#> 26       herb      mix
#> 27       herb      ann
#> 28       herb      ann
#> 29       none      mix
#> 30       none      mix
#> 31       none      ann
#> 32       none      ann
#> 33       herb   perenn
#> 34       herb   perenn
#> 35       none      mix
#> 36       none      mix
#> 37       none   perenn
#> 38       none   perenn
#> 39       herb      ann
#> 40       herb      ann
#> 41       herb   perenn
#> 42       herb   perenn
#> 43       none   perenn
#> 44       none   perenn
#> 45       none      ann
#> 46       none      ann
#> 47       herb      mix
#> 48       herb      mix
#> 49       herb      mix
#> 50       herb      mix
#> 51       herb      ann
#> 52       herb      ann
#> 53       none   perenn
#> 54       none   perenn
#> 55       none   perenn
#> 56       none   perenn
#> 57       herb   perenn
#> 58       herb   perenn
#> 59       none      ann
#> 60       none      ann
#> 61       herb      ann
#> 62       herb      ann
#> 63       none      mix
#> 64       none      mix
#> 65       none      ann
#> 66       none      ann
#> 67       herb      mix
#> 68       herb      mix
#> 69       herb   perenn
#> 70       herb   perenn
#> 71       none      mix
#> 72       none      mix
#> 73       none      mix
#> 74       none      mix
#> 75       herb      mix
#> 76       herb      mix
#> 77       none      ann
#> 78       none      ann
#> 79       herb      ann
#> 80       herb      ann
#> 81       herb   perenn
#> 82       herb   perenn
#> 83       none   perenn
#> 84       none   perenn
#> 85       none      ann
#> 86       none      ann
#> 87       herb   perenn
#> 88       herb   perenn
#> 89       none   perenn
#> 90       none   perenn
#> 91       herb      mix
#> 92       herb      mix
#> 93       none      mix
#> 94       none      mix
#> 95       herb      ann
#> 96       herb      ann
```
