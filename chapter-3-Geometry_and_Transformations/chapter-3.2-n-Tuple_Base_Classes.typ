#import "../template.typ": parec

== n-Tuple Base Classes
<n-Tuple_Base_Classes>

#parec[
  `pbrt`'s classes that represent two- and three-dimensional points, vectors, and surface normals are all based on general $n$ -tuple classes, whose definitions we will start with. The definitions of these classes as well as the types that inherit from them are defined in the files #link("https://github.com/mmp/pbrt-v4/tree/master/src/util/vecmath.h")[`util/vecmath.h`] and #link("https://github.com/mmp/pbrt-v4/tree/master/src/util/vecmath.cpp")[`util/vecmath.cpp`] under the main `pbrt` source directory.
][
  `pbrt`的类用于表示二维和三维的点、向量和表面法线，都是基于通用的 $n$ -元组类，我们将从这些类的定义开始讲解。它们的定义以及从它们继承的类型在主`pbrt`源目录下的文件#link("https://github.com/mmp/pbrt-v4/tree/master/src/util/vecmath.h")[`util/vecmath.h`];和#link("https://github.com/mmp/pbrt-v4/tree/master/src/util/vecmath.cpp")[`util/vecmath.cpp`];中定义。
]

#parec[
  Although this and the following few sections define classes that have simple logic in most of their method implementations, they make more use of advanced C++ programming techniques than we generally use in `pbrt`. Doing so reduces the amount of redundant code needed to implement the point, vector, and normal classes and makes them extensible in ways that will be useful later. If you are not a C++ expert, it is fine to gloss over these details and to focus on understanding the functionality that these classes provide. Alternatively, you could use this as an opportunity to learn more corners of the language.
][
  虽然本节和接下来的几节定义的类在大多数方法实现中逻辑简单，但它们比我们通常在`pbrt`中使用的更充分地利用了高级的C++编程技术。这样做减少了实现点、向量和法线类所需的冗余代码量，并使它们在以后有用的方式上可扩展。如果你不是C++专家，就可以略过这些细节，专注于理解这些类提供的功能。或者，你可以借此机会学习更多关于语言的角落。
]

#parec[
  Both `Tuple2` and #link("Tuple3")[Tuple3] are template classes. They are templated not just on a type used for storing each coordinate's value but also on the type of the class that inherits from it to define a specific two- or three-dimensional type. If one has not seen it before, this is a strange construction: normally, inheritance is sufficient, and the base class has no need to know the type of the subclass. #footnote[This form of inheritance is often referred to as the _curiously recurring template pattern_ (CRTP) in C++.] In this case, having the base class know the child class's type makes it possible to write generic methods that operate on and return values of the child type, as we will see shortly.
][
  `Tuple2`和#link("<Tuple3>")[Tuple3];都是模板类。它们不仅在用于存储每个坐标值的类型上进行模板化，还在继承它的类的类型上进行模板化，以定义特定的二维或三维类型。如果以前没有见过，这是一种奇怪的构造：通常，继承是足够的，基类不需要知道子类的类型。#footnote[这种形式的继承通常被称为C++中的_奇异递归模板模式_（CRTP）。] 在这种情况下，让基类知道子类的类型使得可以编写操作和返回子类类型值的通用方法，如我们将很快看到的。
]

```cpp
// <<Tuple2 Definition>>=
template <template <typename> class Child, typename T>
class Tuple2 {
  public:
    // <<Tuple2 Public Methods>>
    // <<Tuple2 Public Members>>
};
```

#parec[
  The two-dimensional tuple stores its values as `x` and `y` and makes them available as public member variables. The pair of curly braces after each one ensures that the member variables are #emph[default
initialized]; for numeric types, this initializes them to 0.
][
  二维元组将其值存储为`x`和`y`，并将它们作为公共成员变量公开。每个后面的花括号确保成员变量是#emph[默认初始化];的；对于数值类型，这将它们初始化为0。
]


```cpp
// <<Tuple2 Public Members>>=
T x{}, y{};
```


#parec[
  We will focus on the `Tuple3` implementation for the remainder of this section. `Tuple2` is almost entirely the same but with one fewer coordinate.
][
  我们将在本节的其余部分关注`Tuple3`的实现。`Tuple2`几乎完全相同，但少一个坐标。
]

```cpp
// <<Tuple3 Definition>>=
template <template <typename> class Child, typename T>
class Tuple3 {
  public:
    // <<Tuple3 Public Methods>>
    // <<Tuple3 Public Members>>
};
```

#parec[
  By default, the $( x, y, z )$ values are set to zero, although the user of the class can optionally supply values for each of the components. If the user does supply values, the constructor checks that none of them has the floating-point "not a number" (NaN) value using the #link("../Utilities/User_Interaction.html#DCHECK")[DCHECK()] macro. When compiled in optimized mode, this macro disappears from the compiled code, saving the expense of verifying this case. NaNs almost certainly indicate a bug in the system; if a NaN is generated by some computation, we would like to catch it as soon as possible in order to make isolating its source easier. (See @floating-point-arithmetic for more discussion of NaN values.)
][
  默认情况下， $( x, y, z )$ 值被设置为零，尽管类的用户可以选择为每个组件提供值。如果用户确实提供了值，构造函数将使用#link("../Utilities/User_Interaction.html#DCHECK")[DCHECK()];宏检查它们中没有一个具有浮点“非数字”（NaN）值。当在优化模式下编译时，这个宏将从编译代码中消失，从而节省验证此情况的开销。NaN几乎肯定表示系统中的一个错误；如果某些计算生成了NaN，我们希望尽快捕获它，以便更容易隔离其来源。（有关NaN值的更多讨论，请参见@floating-point-arithmetic。）
]

```cpp
// <<Tuple3 Public Methods>>=
Tuple3(T x, T y, T z) : x(x), y(y), z(z) { DCHECK(!HasNaN()); }
```


#parec[
  Readers who have been exposed to object-oriented design may question our decision to make the tuple component values publicly accessible. Typically, member variables are only accessible inside their class, and external code that wishes to access or modify the contents of a class must do so through a well-defined API that may include selector and mutator functions. Although we are sympathetic to the principle of encapsulation, it is not appropriate here. The purpose of selector and mutator functions is to hide the class's internal implementation details. In the case of three-dimensional tuples, hiding this basic part of their design gains nothing and adds bulk to code that uses them.
][
  接触过面向对象设计的读者可能会质疑我们决定使元组组件值公开可访问的决定。通常，成员变量只能在其类内部访问，外部代码如果希望访问或修改类的内容，必须通过一个定义良好的API来实现，该API可能包括选择器和修改器函数。尽管我们同情封装原则，但在这里并不合适。选择器和修改器函数的目的是隐藏类的内部实现细节。在三维元组的情况下，隐藏其设计的这一基本部分没有任何好处，并增加了使用它们的代码的冗余。
]


```cpp
// <<Tuple3 Public Members>>=
T x{}, y{}, z{};
```

#parec[
  The `HasNaN()` test checks each component individually.
][
  `HasNaN()`测试分别检查每个组件。
]


```cpp
// <<Tuple3 Public Methods>>+=
bool HasNaN() const { return IsNaN(x) || IsNaN(y) || IsNaN(z); }
```

#parec[
  An alternate implementation of these two tuple classes would be to have a single template class that is also parameterized with an integer number of dimensions and to represent the coordinates with an array of that many `T` values. While this approach would reduce the total amount of code by eliminating the need for separate two- and three-dimensional tuple types, individual components of the vector could not be accessed as `v.x` and so forth. We believe that, in this case, a bit more code in the vector implementations is worthwhile in return for more transparent access to components. However, some routines do find it useful to be able to easily loop over the components of vectors; the tuple classes also provide a C++ operator to index into the components so that, given an instance `v`, `v[0] == v.x` and so forth.
][
  这两个元组类的另一种实现方法是有一个单一的模板类，该类也用一个整数维数参数化，并用一个具有多个`T`值的数组表示坐标。虽然这种方法通过消除对单独的二维和三维元组类型的需求来减少代码总量，但向量的各个组件不能像`v.x`那样访问。 我们认为，在这种情况下，向量实现中多一点代码是值得的，以换取更透明的组件访问。然而，一些例程确实发现能够轻松地循环遍历向量的组件是有用的；元组类还提供了一个C++运算符来索引组件，以便给定一个实例`v`，`v[0] == v.x`等等。
]

```cpp
// <<Tuple3 Public Methods>>+=
T operator[](int i) const {
    if (i == 0) return x;
    if (i == 1) return y;
    return z;
}
```


#parec[
  If the tuple type is non-`const`, then indexing returns a reference, allowing components of the tuple to be set.
][
  如果元组类型不是`const`，则索引返回一个引用，允许设置元组的组件。
]


```cpp
// <<Tuple3 Public Methods>>+=
T &operator[](int i) {
    if (i == 0) return x;
    if (i == 1) return y;
    return z;
}
```

#parec[
  We can now turn to the implementation of arithmetic operations that operate on the values stored in a tuple. Their code is fairly dense. For example, here is the method that adds together two three-tuples of some type (for example, `Child` might be `Vector3`, the forthcoming three-dimensional vector type).
][
  我们现在可以转向实现对元组中存储的值进行操作的算术运算。它们的代码相当密集。例如，这里是一个方法，它将某种类型的两个三元组相加（例如，`Child`可能是`Vector3`，即将到来的三维向量类型）。
]

```cpp
// <<Tuple3 Public Methods>>+=
template <typename U>
auto operator+(Child<U> c) const -> Child<decltype(T{} + U{})> {
    return {x + c.x, y + c.y, z + c.z};
}
```


#parec[
  There are a few things to note in the implementation of `operator+`. By virtue of being a template method based on another type `U`, it supports adding two elements of the same `Child` template type, though they may use different types for storing their components (`T` and `U` in the code here). However, because the base type of the method's parameter is `Child`, it is only possible to add two values of the same child type using this method. If this method instead took a `Tuple3` for the parameter, then it would silently allow addition with any type that inherited from `Tuple3`, which might not be intended.
][
  在`operator+`的实现中需要注意几点。由于是基于另一种类型`U`的模板方法，它支持将两个相同`Child`模板类型的元素相加，尽管它们可能使用不同的类型来存储其组件（此处代码中的`T`和`U`）。 然而，由于方法参数的基类型是`Child`，因此只能使用此方法添加两个相同子类型的值。如果此方法改为将`Tuple3`作为参数，那么它将默默允许与从`Tuple3`继承的任何类型相加，这可能不是预期的。
]

#parec[
  There are two interesting things in the declaration of the return type, to the right of the `->` operator after the method's parameter list. First, the base return type is `Child`; thus, if one adds two `Vector3` values, the returned value will be of `Vector3` type. This, too, eliminates a class of potential errors: if a `Tuple3` was returned, then it would for example be possible to add two `Vector3`s and assign the result to a `Point3`, which is nonsensical. Finally, the component type of the returned type is determined based on the type of an expression adding values of types `T` and `U`. Thus, this method follows C++'s standard type promotion rules: if a `Vector3` that stored integer values is added to one that stores `Float`s, the result is a `Vector3` storing `Float`s.
][
  在返回类型的声明中有两件有趣的事情，在方法参数列表后面的`->`运算符的右边。首先，基本返回类型是`Child`；因此，如果一个添加两个`Vector3`值，返回的值将是`Vector3`类型的。这也消除了潜在错误的一类情况：如果返回的是`Tuple3`，那么例如可以将两个`Vector3`相加并将结果赋给`Point3`，这是没有意义的。 最后，返回类型的组件类型是基于添加类型为`T`和`U`的值的表达式的类型确定的。因此，该方法遵循C++的标准类型提升规则：如果一个存储整数值的`Vector3`与一个存储`Float`的`Vector3`相加，结果是一个存储`Float`的`Vector3`。
]

#parec[
  In the interests of space, we will not include the other `Tuple3` arithmetic operators here, nor will we include the various other utility functions that perform component-wise operations on them. The full list of capabilities provided by #link("<Tuple2>")[Tuple2] and #link("<Tuple3>")[Tuple3] is:
][
  出于篇幅考虑，我们在这里不包括其他`Tuple3`算术运算符，也不包括执行组件操作的各种其他实用函数。#link("<Tuple2>")[Tuple2];和#link("<Tuple3>")[Tuple3];提供的完整功能列表是：
]

#parec[
  - The basic arithmetic operators of per-component addition, subtraction, and negation, including the "in place" (e.g., `operator+=`) forms of them.
][
  - 基本的按组件加法、减法和取反算术运算符，包括“原址”形式（例如，`operator+=`）。
]

#parec[
  - Component-wise multiplication and division by a scalar value, including "in place" variants.
][
  - 按标量值进行的组件乘法和除法，包括“就地”变体。
]

#parec[
  - #link("Tuple3::Abs")[`Abs(a)`];, which returns a value where the absolute value of each component of the tuple type has been taken.
][
  - #link("Tuple3::Abs")[`Abs(a)`];，返回一个值，其中元组类型的每个组件的绝对值已被取。
]

#parec[
  - #link("Tuple3::Ceil")[`Ceil(a)`] and #link("Tuple3::Floor")[Floor(a)];, which return a value where the components have been rounded up or down to the nearest integer value, respectively.
][
  - #link("Tuple3::Ceil")[Ceil(a)];和#link("Tuple3::Floor")[Floor(a)];，分别返回一个值，其中组件已被向上或向下舍入到最近的整数值。
]

#parec[
  - #link("Tuple3::Lerp")[Lerp(t, a, b)];, which returns the result of the linear interpolation $(1 - t) * a + t * b$.
][
  - #link("Tuple3::Lerp")[Lerp(t, a, b)];，返回线性插值的结果$(1 - t) * a + t * b$。
]

#parec[
  - #link("Tuple3::FMA")[FMA(a, b, c)];, which takes three tuples and
    returns the result of a component-wise fused multiply-add $a * b + c$.
][
  - #link("Tuple3::FMA")[FMA(a, b, c)];，接受三个元组并返回组件的融合乘加 $a * b + c$的结果。
]

#parec[
  - #link("Tuple3::Min")[Min(a, b)] and #link("Tuple3::Max")[Max(a, b)];, which respectively return the component-wise minimum and maximum of the two given tuples.
][
  - #link("Tuple3::Min")[Min(a, b)];和#link("Tuple3::Max")[Max(a, b)];，分别返回给定两个元组的组件最小值和最大值。
]

#parec[
  - #link("Tuple3::MinComponentValue")[MinComponentValue(a)] and #link("Tuple3::MaxComponentValue")[MaxComponentValue(a)];, which respectively return the minimum and maximum value of the tuple's components.
][
  - #link("Tuple3::MinComponentValue")[MinComponentValue(a)];和#link("Tuple3::MaxComponentValue")[MaxComponentValue(a)];，分别返回元组组件的最小值和最大值。
]

#parec[
  - #link("Tuple3::MinComponentIndex")[MinComponentIndex(a)] and #link("Tuple3::MaxComponentIndex")[MaxComponentIndex(a)];, which respectively return the zero-based index of the tuple element with minimum or maximum value.
][
  - #link("Tuple3::MinComponentIndex")[MinComponentIndex(a)];和#link("Tuple3::MaxComponentIndex")[MaxComponentIndex(a)];，分别返回具有最小值或最大值的元组元素的零基索引。
]

#parec[
  - #link("Tuple3::Permute")[Permute(a, perm)];, which returns the permutation of the tuple according to an array of indices.
][
  - #link("Tuple3::Permute")[Permute(a, perm)];，根据索引数组返回元组的排列。
]

#parec[
  - #link("Tuple3::HProd")[HProd(a)];, which returns the horizontal product—the component values multiplied together.
][
  - #link("Tuple3::HProd")[HProd(a)];，返回水平乘积——组件值相乘。
]