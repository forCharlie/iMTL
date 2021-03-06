How to test
=========================================

Run ```toy_explore``` in this folder to get the results as follows, which verify the importance of encoding true knowledge in MTRL

    The real correlation matrix
       1.000000000000000  -0.999999964548093   0.999999990723089
      -0.999999964548092   1.000000000000000  -0.999999991541510
       0.999999990723088  -0.999999991541511   1.000000000000000

    The correlation matrix by learned Omega
       1.000000000000000   0.999922551405160  -0.999968986310554
       0.999922551405160   1.000000000000000  -0.999923027359159
      -0.999968986310554  -0.999923027359159   1.000000000000000

    W from MTRL
      -3.728281536621217  -2.660500979818787   3.010460890627252

    l2 norm of the MTRL_W - W_real
       9.724180733708662

    W from kMTRL
       0.685027887129338  -0.387825361538005   2.584036359739555

    l2 norm of the kMTRL_W - W_real
       7.934401027294618
