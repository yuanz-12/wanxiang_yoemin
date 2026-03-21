# 鸢鸣万象输入方案

## 方案简介
[鸢鸣万象](https://github.com/yuanz-12/wanxiang_yoemin)是一个Rime输入方案，通过缝合、改写作者曾经用过的Rime方案改造而来，主要基于[万象拼音](https://github.com/amzxyz/rime_wanxiang)输入方案。方案的`schema_id`后缀取自“鸢鸣”的吴语拼音。

### 优势介绍：
- **精准输入**：采用带声调的音码方案李氏三拼，提高输入精准性，搭配目前质量最高的大陆规范带调拼音词库——万象词库，堪称如虎添翼。
- **辅码支持**：内置辅助码功能，可有效筛选、去重候选项。方案自带词库采用墨奇辅助码，用户也可通过替换词库自行切换为鹤形辅助码、自然辅助码、汉心辅助码等自己喜欢的方案。
- **功能丰富**：移植了原版万象方案中多项实用功能，包括数字金额大写、超级计算器、超级注释、超级提示等。
- **优化改进**：相比原版李氏三拼方案，精简改写了部分拼写运算规则以提升性能，并新增了自定义短语、适配本方案拼写的symbols表及其他实用配置。

### 免责声明：
- 本方案的普适性较低，注定不会适合大多数人，仅供同好交流学习使用。
- 本方案维护频率较低，作者水平有限，使用过程中如遇到问题，还请多多包涵。

## 新手快速入门

1. 请确保自己在使用本方案前具备Rime基本知识，以下几点均基于用户满足该前提的情况。

2. 本仓库不包含完整的词库文件，直接部署会报错。请在下载仓库内容后额外下载[万象词库](https://github.com/amzxyz/rime_wanxiang/releases/tag/dict-nightly)和[萌娘词库](https://github.com/suiginko/moetype/releases)，解压后将其移入`dicts`文件夹再重新部署。需要[万象模型](https://github.com/amzxyz/RIME-LMDG/releases/download/LTS/wanxiang-lts-zh-hans.gram)的用户，同样需要自行额外下载。

3. `custom`文件夹下的`wanxiang_yoemin.custom.yaml`文件是方案的custom示例，预设内容为将拼写规则切换为base版（即无辅助码版）。base版拼写规则的第一步会将万象Pro版词库格式转换为基础版格式，因此base版与pro版均可搭配万象Pro版词库使用。若用户仅需使用万象词库而无需扩展词库，只需解除示例文件中相应行的注释，即可快速上手。


## 鸣谢及友链

- 万象拼音 https://github.com/amzxyz/rime_wanxiang 参考了其中的很多配置
- 李氏三拼 https://github.com/arsenali/rime-triple-pinyin-lssp 本方案所使用的音码
- 万象词库 https://github.com/amzxyz/RIME-LMDG 带调方案的最佳搭档
- 萌娘词库 https://github.com/suiginko/moetype 适合二次元爱好者的细胞词库
- 墨奇音形 https://github.com/gaboolic/rime-shuangpin-fuzhuma 本方案默认使用的辅助码
- 白霜拼音 https://github.com/gaboolic/rime-frost 参考了候选标识、火星文OpenCC
