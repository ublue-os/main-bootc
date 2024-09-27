# Changelog

## 1.0.0 (2024-09-27)


### Features

* build base images rather than main images ([#12](https://github.com/ublue-os/main-bootc/issues/12)) ([15608bb](https://github.com/ublue-os/main-bootc/commit/15608bbe3d3de3c6f5d83605de66f9ce5fd1a914))
* **ci:** Add support for aarch64 ([c882a5c](https://github.com/ublue-os/main-bootc/commit/c882a5c1c777cac65a8e38b6104dea7222402ac0))
* **ci:** Move to Docker ([8816ffb](https://github.com/ublue-os/main-bootc/commit/8816ffb64e5bb54f18682bff7e3ff8791df8bd1c))
* initial bootc desktop builds ([#6](https://github.com/ublue-os/main-bootc/issues/6)) ([4d82532](https://github.com/ublue-os/main-bootc/commit/4d82532b3839d243b19521eef8900845d810c5ef))
* install packages from ublue-os/main ([#8](https://github.com/ublue-os/main-bootc/issues/8)) ([c95299d](https://github.com/ublue-os/main-bootc/commit/c95299d6ccd05c1bb0df60cc0342fe2cef41d872))
* regenerate initramfs ([3a96279](https://github.com/ublue-os/main-bootc/commit/3a96279e4c9ac2e8534edf63e0c67238e65fb3bf))


### Bug Fixes

* **ci:** Correct image name in metadata ([af2ca2b](https://github.com/ublue-os/main-bootc/commit/af2ca2b0d21c565d87313ff5fcb5b7419b62a6e8))
* **ci:** Correctly sign image ([16cffb8](https://github.com/ublue-os/main-bootc/commit/16cffb827171e9219c028cd587eb54c926a768c6))
* **ci:** Don't disable content trust ([61f1190](https://github.com/ublue-os/main-bootc/commit/61f1190274fda7b74a580aefd1bc90c2ca64409f))
* **ci:** Fix tag generation ([aa376f6](https://github.com/ublue-os/main-bootc/commit/aa376f64549d9489eafb41bd18dd1954b4be9f7d))
* **ci:** Setup qemu before building multiplat images ([0f303e9](https://github.com/ublue-os/main-bootc/commit/0f303e944ba34d9a4abb8995d6a223eaac403727))
* **ci:** Use buildx as Docker driver ([ed5413a](https://github.com/ublue-os/main-bootc/commit/ed5413a385a9d58bf37a9d8ac934b1cef6c0fbdf))
* **ci:** Use Docker to pull base image ([8b9397d](https://github.com/ublue-os/main-bootc/commit/8b9397d716760e8cc6fd10028a6db0e8929a1cea))
* disable composefs ([9f23726](https://github.com/ublue-os/main-bootc/commit/9f23726388aa0e802c2f2aa68547244a8175ff14))
* exclude gnome packages which should be flatpaks ([#10](https://github.com/ublue-os/main-bootc/issues/10)) ([7bfd9ce](https://github.com/ublue-os/main-bootc/commit/7bfd9cefe9b4fc496c3064b258d98fa4b6479717))
* explicitly enable gdm service ([ae3787a](https://github.com/ublue-os/main-bootc/commit/ae3787a6f5e1c62ecc33ef556b7abdd97561d840))
* install correct packages for each variant ([#9](https://github.com/ublue-os/main-bootc/issues/9)) ([d58f4df](https://github.com/ublue-os/main-bootc/commit/d58f4df4c9b88fad4e492bd4194e5fca27bbc731))
* login to GHCR before signing ([#20](https://github.com/ublue-os/main-bootc/issues/20)) ([6dea5d2](https://github.com/ublue-os/main-bootc/commit/6dea5d2cbdda896e9fd50f7df2dc01441a53f851))
* remove latest tag for push step ([#18](https://github.com/ublue-os/main-bootc/issues/18)) ([ab6c2c7](https://github.com/ublue-os/main-bootc/commit/ab6c2c71086d207f32fd8207b34f8f1c4567609f))
* use github.sha as tag rather than digest ([1f5867e](https://github.com/ublue-os/main-bootc/commit/1f5867edc19027c7e00b0964f430e94f1841d5d9))
* use github.sha as tag rather than digest during signing ([#19](https://github.com/ublue-os/main-bootc/issues/19)) ([1f5867e](https://github.com/ublue-os/main-bootc/commit/1f5867edc19027c7e00b0964f430e94f1841d5d9))
