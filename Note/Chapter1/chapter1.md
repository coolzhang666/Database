# 第一章 绪论

----------

## 1.1 数据库系统概述
### 1.1.1 数据库的 4 个基本概念

1. **数据（data）**
    * **定义**：描述事物的符号记录称之为**数据**
    * 数据的含义称之为数据的**语义**，**数据和语义是密不可分的**

1. **数据库（DataBase, DB）**
    * 数据库就是存放数据的仓库
    * **数据库是长期存放在计算机内、有组织的、可共享的大量数据的集合。数据库中的数据按一定的数据模型组织、描述和存储，具有较小的冗余度、较高的数据独立性和易扩展性，并可为各种用户共享**
    * 数据库的三个基本特点：
        1. **永久存储**
        1. **有组织**
        1. **可共享**

1. **数据库管理系统（DataBase Management System, DBMS）**
    * **任务**：**科学的**组织存储结构，**高效的**获取和维护数据
    * 数据库管理系统和操作系统一样是**计算机的基础软件**
    * 它的主要功能包括：
        1. **数据定义功能**
        1. **数据组织、存储和管理**
        1. **数据操纵功能**
        1. **数据库的事务管理和运行管理**
        1. **数据库的建立与维护功能**
        1. **其他功能**

1. **数据库系统（DataBase System, DBS）**
    * **数据库系统是由数据库、数据库管理系统（及其应用开发工具）、应用程序和数据库管理员组成的存储、管理、处理和维护数据的系统**

### 1.1.2 数据管理技术的产生和发展
* 数据库技术是应数据管理任务的需要而产生的。
* 数据管理技术的发展经过了三个阶段：
    1. **人工管理阶段**
        * 数据不保存
        * 应用程序管理数据
        * 数据不共享
        * 数据不具有独立性
    
    1. **文件系统阶段**
        * 数据可以长期保存
        * 由文件系统管理数据
        * 数据共享性差，冗余度大
        * 数据独立性差

    1. **数据库系统阶段**
        * 为解决多用户、多应用共享数据的需要，使数据为尽可能多的的应用服务，数据库技术便应运而生
        * **从文件系统到数据库系统标志着数据管理技术的飞跃**

### 1.1.3 数据库系统的特点
1. **数据结构化**
    * **数据库系统实现整体数据的结构化，这是数据库的主要特征之一，也是数据库系统与文件系统的本质区别**
    * **所谓“整体”结构化是指数据库中的数据不再仅仅针对某一个应用，而是面向整个组织或企业；不仅数据内部是结构化的，而且整体是结构化的，数据之间是具有联系的**

1. **数据的共享性高、冗余度低且易扩充**
    * **数据共享可以大大减少数据冗余，节约存储空间。数据共享还能够避免数据之间的不相容性和不一致性**
        * 不一致性是指同一数据不同副本的值不一样
    * 数据库系统**弹性大，易于扩充**

1. **数据独立性高**
    * 独立性包括物理独立性和逻辑独立性：
        1. **物理独立性**是指用户的应用程序与数据库中数据的物理存储是相互独立的，程序员不需要知道数据在数据库中是如何存储的
        1. **逻辑独立性**是指用户的应用程序与数据库的逻辑结构是相互独立的，当数据的逻辑结构改变时，程序员可以不改变应用程序
    * 独立性**简化了**应用程序的编制，**减少了**应用程序的维护和修改

1. **数据由数据库管理系统统一管理和控制**
    * 数据的共享将会带来安全隐患，数据的共享是**并发共享**，多个用户可以同时修改数据库中的同一个数据，所以数据库中数据的**正确性与一致性**也必须得到保障，故数据库管理系统提供以下几个方面的数据控制功能：
        1. **数据的安全性（security）保护**
            数据的安全性是指保护数据以防止不合法使用造成的数据泄密和破坏
        1. **数据的完整性（integrity）检查**
            数据的完整性指数据的正确性、有效性和相容性
        1. **并发（concurrency）控制**
        1. **数据恢复（recovery）**
    * **数据库管理系统在数据库建立、运用和维护时对数据库进行统一控制，以保证数据的完整性和安全性，并在多用户弄湿使用数据库时进行并发控制，在发生故障后对数据库进行恢复**
    * 数据库管理系统的出现使信息系统**从以加工数据的程序为中心转向围绕共享的数据库为中心的新阶段**


## 1.2 数据模型
* 数据模型也是一种模型，它**是对现实世界数据特征的抽象**，数据模型是用来描述数据、组织数据和对数据进行操作的
* **数据模型是数据库系统的核心和基础**

### 1.2.1 两类数据模型
* 数据模型应满足三方面的要求：一是**能比较真实地模拟现实世界**，二是**容易为人所理解**，三是**便于在计算机上实现**
* 根据模型应用的不同目的，可以将这些模型划分为两个大类，它们分别属于两个不同的层次。**第一类是概念模型，第二类是逻辑模型和物理模型**

### 1.2.2 概念模型
* 概念模型实际上是现实世界到及其世界的一个中间层次
1. **信息世界中的基本概念**
    1. **实体（entity）**
        **客观存在并可相互区别的事物称为实体**，例如：一个职工、一门课、一次订单
    1. **属性（attribute）**
        **实体所具有的某一特性称为属性**，例如：学生的学号，姓名，性别等
    1. **码（Key）**
        **唯一标识实体的属性集称为码**，例如：学号是学生实体的码
    1. **实体型（entity type）**
        具有相同属性的实体必然具有共同的特性和性质。**用实体型机器属性名集合来丑行和刻画同类实体，称为实体型**，例如：学生（学号，姓名，性别...）就是一个实体型
    1. **实体集（entity set）**
        同一类型实体的集合称为实体集。例如：全体学生就是一个实体集
    1. **联系（relationship）**
        * 在现实世界中，事物内部以及事物之间是有联系的，这些联系在信息世界中反映为实体（型）内部的联系和实体（型）之间的联系。
        * 实体内部的联系通常是指组成实体的各属性之间的联系，**实体之间的联系通常是指不同实体集之间的联系**
        * **实体之间的联系有一对一、一对多和多对多等多种类型**
1. **概念模型的一种表示方法：实体-联系方法**
    **实体-联系方法**用**E-R 图**来描述现实世界的概念模型，**E-R 方法也称为 E-R 模型**

### 1.2.3 数据模型的组成要素
* 数据模型描述了系统的静态特性、动态特性和完整性约束条件。因此**数据模型通常由数据结构、数据操作和数据的完整性约束条件三部分组成
1. **数据结构**
    * **数据结构描述数据库的组成对象以及对象之间的联系**
    * 数据结构所描述的对象类型的集合，是对系统静态特性的描述
1. **数据操作**
    * **数据操作是指对数据库中各种对象（型）的实例（值）允许执行的操作的集合，包括操作及有关的操作规则**
    * 数据操作是对系统动态特性的描述
1. **数据的完整性约束条件**
    * **数据的完整性约束条件时一组完整性规则**

### 1.2.4 常用的数据模型
* 数据库领域中主要的逻辑数据模型有：
    * 层次模型
    * 网状模型
    * **关系模型**
    * 面向对象数据模型
    * 对象关系数据模型
    * 半结构化数据模型
* **层次联系**是指两个记录以及它们之间的一对多（包含一对一）的联系

### 1.2.5 层次模型
* 层次模型用**树形结构**来表示各类实体以及实体间的联系
1. **层次模型的数据结构**
    * **在数据库中定义满足下面两个条件的基本层次联系的集合为层次模型：**
        1. 有且只有一个节点没有双亲结点，这个结点称为根结点
        1. 跟以外的其他结点有且只有一个双亲结点
    * **层次模型像一棵倒立的树，结点的双亲是惟一的**，所以层次数据库系统只能处理一对多的实体联系

1. **层次模型的数据操纵与完整性约束**
    * 插入操作：没有相应的双亲结点值就不能插入它的子女结点值
    * 删除操作：删除双亲结点值，则相应的子女结点值也将被同时删除

1. **层次模型的优缺点**
* **优点：**
    1. 层次模型的数据结构比较简单清晰
    1. 层次数据库的查询效率高
    1. 层次数据模型提供了良好的完整性支持
* **缺点**
    1. 层次模型不适合处理多对多联系
    1. 对插入删除操作的限制比较多
    1. 查询子女结点必须通过双亲结点
    1. 由于结构严密，层次命令趋于程序化

### 1.2.6 网状模型
* 网状模型用**图**来表示各类实体以及实体间的联系
1. **网状模型的数据结构**
    * **在数据库中，把满足以下两个条件的基本层次联系集合称为网状模型**
        1. 允许一个以上的结点无双亲
        1. 一个结点可以有多于一个的双亲
    * **网状模型中子女结点与双亲结点的联系是可以不唯一的**

1. **网状模型的数据库操纵与完整性约束**
    * 网状模型一般来说没有层次模型那样严格的完整性约束条件，但具体的网状数据库系统对数据操纵都加了一些限制，提供了一定的完整性约束

1. **网状模型的优缺点**
* **优点**
    1. 能够更为直接地描述现实世界，结点之间可以有多重联系
    1. 具有良好的性能，存取效率较高
* **缺点**
    1. 结构比较复杂，随应用环境的扩大，数据库的结构会变得越来越复杂
    1. 网状模型的 DDL、DML 复杂，不容易使用
    1. 应用程序访问数据时必须选择适当的存取路径，用户必须了解系统结构的细节，加重了编写应用程序的负担

### 1.2.7 关系模型
* 关系模型是**最重要**的一种数据模型
1. **关系模型的数据结构**
    * 关系模型由一组关系组成，每个关系的数据结构是一张规范化的二维表
    * 关系模型中的一些术语：
        * **关系（relation）**：一个关系对应通常说的一张表
        * **元祖（tuple）**：表中的一行即为一个元祖
        * **属性（attribute）**：表中的一列即为一个属性，给每一个属性起一个属性名
        * **码（Key）**：也称为**码键**，是表中某个属性组，它可以唯一确定一个元祖
        * **域（domain）**：是一组具有相同数据类型的值的集合
        * **分量**：元祖中的一个属性值
        * **关系模式**：对关系的描述，一般表示为：关系名（属性1，属性2，...，属性n）

1. **关系模型的数据操纵与完整约束**
* 关系的完整性约束条件包括三大类：**实体完整性**、**参照完整性**和**用户定义的完整性**
* 关系模型中的数据操作都是集合操作，**操作对象和操作结果都是关系**
* **关系模型把存取路径向用户隐蔽起来，用户只要指出“干什么”或“找什么”，不必详细说明“怎么干”或“怎么找”，从而提高了数据的独立性，提高了用户生产率**

1. **关系模型的优缺点**
* **优点**：
    1. 关系模型与格式化模型不同，它是建立在严格的**数学概念的基础之上**的
    1. 关系模型的概念单一，所以其**数据结构简单、清晰，用户易懂易用**
    1. 关系模型的存取路径对用户透明
* **缺点**：
    由于存取路径对用户是隐蔽的，查询效率往往不如格式化数据模型

## 1.3 数据库系统的结构
### 1.3.1 数据库系统模式的概念
* **在数据模式中有“型”（type）和“值”（value）的概念**。
* **型**：指对某一类数据的结构和属性的说明
* **值**：是型的一个具体赋值
* **模式**是数据库中全体数据的逻辑结构和特征的描述，它仅仅涉及型的描述，不涉及具体的值。模式的一个具体的值称为模式的一个**实例（instance）**。同一个模式可以有很多实例
* **模式是相对稳定的，而实例是相对变动的**

### 1.3.2 数据库系统的三级模式结构
* 数据库系统的三级模式结构是指数据库系统是由**外模式、模式和内模式**三级构成
1. **模式（schema）**
    * **模式也称逻辑模式，是数据库中全体数据的逻辑结构和特征的描述，是所有用户的公共数据视图**

1. **外模式（external schema）**
    * **外模式也称子模式或用户模式，它是数据库用户能看见和使用的局部数据的逻辑结构和特征的描述，是数据库用户的数据视图，值与某一应用有关的数据的逻辑表示**

1. **内模式（storage schema）**
    * **内模式也称存储模式，一个数据库只有一个内模式，它是数据物理结构和存储方式的描述，是数据在数据库内部的组织方式**

### 1.3.3 数据库的二级映像功能与数据独立性
* 为了能够在系统内部实现这三个抽象层次的联系和装换，数据库系统在这三级模式之间提供了两层映像：**外模式/模式映像**和**模式/内模式映像**
* 这两层映像保证了数据库系统中的数据能够具有较高的逻辑独立性和物理独立性
1. **外模式/模式映像**
    * 模式描述的是数据的全局逻辑结构，外模式描述的是数据的局部逻辑结构
    * 外模式/模式映像定义了外模式与模式之间的对应关系
    * **当模式改变时，由数据库管理员对各个外模式/模式的映像作相应的改变，可以使外模式保持不变。应用成熟时依靠数据的外模式编写的，从而应用程序不必修改，保证了数据与程序的逻辑独立性，简称数据的逻辑独立性**

1. **模式/内模式映像**
    * 数据库中只有一个模式，也只有一个内模式，所以模式/内模式是惟一的
    * 定义了数据全局逻辑结构与存储结构之间的对应关系
    * **当数据库的存储结构改变时，由数据库管理员对模式/内模式映像作相应的改变，可以使模式保持不变，从而因公程序也不必改变。保证了数据与程序的物理独立性，简称数据的物理独立性**

* **数据与程序之间的独立性使得数据的定义和描述可以从应用程序中分离出去**，另外，**由于数据的存取由数据库管理系统管理，从而简化了应用程序的编制，大大减少了应用程序的维护与修改**

## 1.4 数据库系统的组成
1. **硬件平台及数据库**
    * 数据库系统对硬件提出了较高的要求：
        1. **内存足够大**，用于存放操作系统、数据库管理系统的核心模块、数据缓冲区和应用程序
        1. **磁盘或磁盘阵列足够大**，用于存放数据库，备份
        1. **系统通道能力较高**，以提高数据传送率

1. **软件**
    1. 数据库管理系统
    1. 支持数据库管理系统运行的操作系统
    1. 具有与数据库接口的高级语言及其编译系统
    1. 以数据库管理系统为核心的应用开发工具
    1. 为特定应用环境开发的数据库用用系统

1. **人员**
    1. **数据库管理员（DataBase Administrator, DBA）**
        1. 决定数据库中的信息内容和结构
        1. 决定数据库的存储结构和存取策略
        1. 定义数据的安全性和完整性约束
        1. 监控数据库的使用和运行
        1. 数据库的改进和重组、重构
    
    1. **系统分析员和数据库设计人员**
    1. **应用程序员**
    1. **用户**
        1. 偶然用户
        1. 简单用户
        1. 复杂用户
