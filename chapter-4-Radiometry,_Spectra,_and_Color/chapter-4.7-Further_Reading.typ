== Further Reading


McCluney's book on radiometry is an excellent introduction to the topic (McCluney 1994). Preisendorfer (1965) also covered radiometry in an accessible manner and delved into the relationship between radiometry and the physics of light. Nicodemus et al. (1977) carefully defined the BRDF, BSSRDF, and various quantities that can be derived from them.
McCluney关于辐射测量的书是对这个主题的一个很好的介绍（McCluney 1994）。Preisendorfer（1965）也以一种容易理解的方式涵盖了辐射测量学，并深入研究了辐射测量学和光物理学之间的关系。Nicodemus等人（1977）仔细定义了BRDF，BSSRDF以及可以从它们导出的各种量。

Books by Moon and Spencer (1936, 1948) and Gershun (1939) are classic early introductions to radiometry. Lambert's seminal early writings about photometry from the mid-18th century have been translated into English by DiLaura (Lambert 1760).
Moon和Spencer（1936、1948）和Gershun（1939）的书籍是辐射测量学的经典早期介绍。兰伯特的开创性的早期著作测光从中期的世纪已被翻译成英语的迪劳拉（兰伯特1760年）。

Preisendorfer (1965) has connected radiative transfer theory to Maxwell's classical equations describing electromagnetic fields, and further work was done in this area by Fante (1981). Going well beyond earlier work that represented radiance with Wigner distribution functions to model wave effects (Oh 2010, Cuypers et al. 2012), Steinberg and Yan (2021) have recently introduced a comprehensive model of light transport based on a wave model, including a generalization of the light transport equation.
Preisendorfer（1965）将辐射传输理论与描述电磁场的麦克斯韦经典方程联系起来，Fante（1981）在这一领域做了进一步的工作。Steinberg和Yan（2021）远远超出了早期用Wigner分布函数表示辐射以模拟波效应的工作（Oh 2010，Cuypers et al. 2012），最近引入了一个基于波模型的光传输综合模型，包括光传输方程的推广。

Correctly implementing radiometric computations can be tricky: one missed cosine factor and one is computing a completely different quantity than expected. Debugging these sorts of issues can be quite time-consuming. Ou and Pellacini (2010) showed how to use C++'s type system to associate units with each term of these sorts of computations so that, for example, trying to add a radiance value to another value that represents irradiance would trigger a compile time error.
正确执行辐射计算可能很棘手：一个错过了余弦因子，另一个计算的量与预期完全不同。解决这类问题可能非常耗时。Ou和Pellacini（2010）展示了如何使用C++的类型系统将单位与这些计算的每个项相关联，例如，尝试将辐射值添加到另一个表示辐照度的值将触发编译时错误。

The books by McCluney (1994) and Malacara (2002) discuss blackbody emitters and the standard illuminants in detail. The Standard Illuminants are defined in a CIE Technical Report (2004); Judd et al. (1964) developed the approach that was used to define the D Standard Illuminant.
McCluney（1994）和Malacara（2002）的书详细讨论了黑体发射体和标准光源。标准光源在CIE技术报告（2004）中定义; Judd等人（1964）开发了用于定义D标准光源的方法。

Wilkie and Weidlich (2011) noted that common practice in rendering has been to use the blackbody distribution of Equation (4.17) to model light emission for rendering, while Kirchhoff's law, Equation (4.18), would be more accurate. They also pointed out that as objects become hot, their BRDFs often change, which makes Kirchhoff's law more difficult to adopt, especially in that models that account for the effect of temperature variation on BRDFs generally are not available.
Wilkie和Weidlich（2011）指出，渲染中的常见做法是使用公式（4.17）的黑体分布来模拟渲染的光发射，而基尔霍夫定律，公式（4.18）将更准确。他们还指出，随着物体变热，它们的BRDF经常发生变化，这使得基尔霍夫定律更难以采用，特别是考虑温度变化对BRDF影响的模型通常不可用。

Spectral Representations 频谱表示
Meyer was one of the first researchers to closely investigate spectral representations in graphics (Meyer and Greenberg 1980; Meyer et al. 1986). Hall (1989) summarized the state of the art in spectral representations through 1989, and Glassner's Principles of Digital Image Synthesis (1995) covers the topic through the mid-1990s. Survey articles by Hall (1999), Johnson and Fairchild (1999), and Devlin et al. (2002) are good resources on early work on this topic.
Meyer是第一个仔细研究图形中的光谱表示的研究人员之一（Meyer and Greenberg 1980; Meyer et al.1986）。Hall（1989）总结了1989年光谱表示的最新技术，Glassner的Principles of Digital Image Synthesis（1995）涵盖了1990年代中期的主题。Hall（1999）、约翰逊和费尔柴尔德（1999）以及Devlin等人（2002）的调查文章是有关该主题早期工作的良好资源。

Borges (1991) analyzed the error introduced from the tristimulus representation when used for spectral computation. A variety of approaches based on representing spectra using basis functions have been developed, including Peercy (1993), who developed a technique based on choosing basis functions in a scene-dependent manner by considering the spectral distributions of the lights and reflecting objects in the scene. Rougeron and Péroche (1997) projected all spectra in the scene onto a hierarchical basis (the Haar wavelets), and showed that this adaptive representation can be used to stay within a desired error bound. Ward and Eydelberg-Vileshin (2002) developed a method for improving the spectral fidelity of regular RGB-only rendering systems by carefully adjusting the color values provided to the system before rendering.
Borges（1991）分析了三色刺激表示法用于光谱计算时引入的误差。已经开发了各种基于使用基函数表示光谱的方法，包括Peercy（1993），他开发了一种基于通过考虑场景中的光和反射物体的光谱分布以场景依赖的方式选择基函数的技术。Rougeron和Péroche（1997）将场景中的所有光谱投影到分层基础（Haar小波）上，并表明这种自适应表示可以用于保持在期望的误差范围内。Ward和Eydelberg-Vileshin（2002）开发了一种方法，通过在渲染之前仔细调整提供给系统的颜色值来提高常规RGB渲染系统的光谱保真度。

Another approach to spectral representation was investigated by Sun et al. (2001), who partitioned spectral distributions into a smooth base distribution and a set of spikes. Each part was represented differently, using basis functions that worked well for each of these parts of the distribution. Drew and Finlayson (2003) applied a “sharp” basis, which is adaptive but has the property that computing the product of two functions in the basis does not require a full matrix multiplication as many other basis representations do.
Sun等人（2001）研究了另一种谱表示方法，他们将谱分布划分为平滑的基本分布和一组尖峰。每个部分都有不同的表示，使用的基函数对分布的每个部分都很好。Drew和Finlayson（2003）应用了一种“尖锐”基，它是自适应的，但具有计算基中两个函数的乘积不需要像许多其他基表示那样进行全矩阵乘法的特性。

Both Walter et al. (1997) and Morley et al. (2006) described light transport algorithms based on associating a single wavelength with each light path. Evans and McCool (1999) generalized these techniques with stratified wavelength clusters, which are effectively the approach implemented in SampledSpectrum and SampledWavelengths.
Walter等人（1997）和莫利等人（2006）都描述了基于将单个波长与每个光路相关联的光传输算法。Evans和McCool（1999）将这些技术与分层波长簇进行了推广，这是在 SampledSpectrum 和 SampledWavelengths 中有效实现的方法。

Radziszewski et al. (2009) noted that it is not necessary to terminate all secondary spectral wavelengths when effects like dispersion happen at non-specular interfaces; they showed that it is possible to compute all wavelengths' contributions for a single path, weighting the results using multiple importance sampling. Wilkie et al. (2014) used equally spaced point samples in the wavelength domain and showed how this approach can also be used for photon mapping and rendering of participating media.
Radziszewski等人（2009年）指出，当色散等效应发生在非镜面反射界面时，没有必要终止所有次级光谱波长;他们表明可以计算单个路径的所有波长的贡献，使用多个重要性采样对结果进行加权。Wilkie等人（2014）在波长域中使用了等距点样本，并展示了这种方法如何也可用于光子映射和参与介质的渲染。

Color 颜色
For background information on properties of the human visual system, Wandell's book on vision is an excellent starting point (Wandell 1995). Ferwerda (2001) presented an overview of the human visual system for applications in graphics, and Malacara (2002) gave a concise overview of color theory and basic properties of how the human visual system processes color. Ciechanowski (2019) presented an excellent interactive introduction to color spaces; his treatment has influenced our presentation of the XYZ color space and chromaticity.
关于人类视觉系统特性的背景信息，Wandell关于视觉的书是一个很好的起点（Wandell 1995）。Ferwerda（2001）概述了人类视觉系统在图形中的应用，Malacara（2002）简要概述了颜色理论和人类视觉系统如何处理颜色的基本属性。Ciechanowski（2019）对颜色空间进行了出色的交互式介绍;他的处理影响了我们对XYZ颜色空间和色度的介绍。

A number of different approaches have been developed for mapping out-of-gamut colors to ones that can be displayed on a device with particular display primaries. This problem can manifest itself in a few ways: a color's chromaticity may be outside of the displayed range, its chromaticity may be valid but it may be too bright for display, or both may be out of range.
已经开发了许多不同的方法来将色域外颜色映射到可以在具有特定显示原色的设备上显示的颜色。这个问题可以通过几种方式表现出来：颜色的色度可能在显示范围之外，它的色度可能是有效的，但它可能太亮而无法显示，或者两者都可能在范围之外。

For the issue of how to handle colors with undisplayable chromaticities, see Rougeron and Péroche's survey article, which includes references to many approaches (Rougeron and Péroche 1998). This topic was also covered by Hall (1989). Morovi's book (2008) covers this topic, and a more recent survey has been written by Faridul et al. (2016).
关于如何处理具有不可显示色度的颜色的问题，请参阅Rougeron和Péroche的调查文章，其中包括对许多方法的引用（Rougeron和Péroche 1998）。Hall（1989）也讨论了这个问题。Morovi的书（2008年）涵盖了这个主题，Faridul等人（2016年）撰写了一份最近的调查。

While high dynamic range displays that can display a wide range of intensities are now starting to become available, most of them are still not able to reproduce the full range of brightness in rendered images. This problem can be addressed with tone reproduction algorithms that use models of human visual response to make the most of displays' available dynamic ranges. This topic became an active area of research starting with the work of Tumblin and Rushmeier (1993). The survey article of Devlin et al. (2002) summarizes most of the work in this area through 2002, giving pointers to the original papers. See Reinhard et al.'s book (2010) on high dynamic range imaging, which includes comprehensive coverage of this topic through 2010. More recently, Reinhard et al. (2012) have developed tone reproduction algorithms that consider both accurate brightness and color reproduction together, also accounting for the display and viewing environment, and Eilertsen et al. (2017) surveyed algorithms for tone mapping of video.
虽然可以显示宽范围强度的高动态范围显示器现在开始变得可用，但它们中的大多数仍然不能再现渲染图像中的全部亮度范围。这个问题可以通过色调再现算法来解决，该算法使用人类视觉响应的模型来充分利用显示器的可用动态范围。这个主题成为一个活跃的研究领域开始与工作的Tumblin和Rushmeier（1993年）。Devlin et al.（2002）的综述文章总结了2002年在这一领域的大部分工作，并指出了原始论文。参见Reinhard et al.的书（2010年）的高动态范围成像，其中包括全面覆盖这一主题，直到2010年。最近，Reinhard et al. （2012）开发了色调再现算法，该算法同时考虑了准确的亮度和颜色再现，还考虑了显示和观看环境，Eilertsen等人（2017）调查了视频色调映射的算法。

From RGB to Spectra 从RGB到Spectra
Glassner (1989b) did early work on converting RGB values to spectral distributions. Smits (1999) optimized discrete reflectance spectra to reproduce primaries (red, green, blue) and combinations of primaries (yellow, cyan, magenta, white) based on the observation that linear interpolation in such an extended space tends to produce smoother reflectance spectra. Mallett and Yuksel (2019) presented a surprising result showing that linear interpolation of three carefully chosen spectra can fully cover the sRGB gamut, albeit at some cost in terms of smoothness. Meng et al. (2015) optimized a highly smooth spectral interpolant based on a dense sampling of the space of chromaticities, enabling usage independent of any specific RGB gamut.
Glassner（1989 b）在将RGB值转换为光谱分布方面做了早期工作。Smits（1999）优化离散反射光谱以再现原色（红色、绿色、蓝色）和原色的组合（黄色、青色、洋红、白色），其基于这样的扩展空间中的线性插值倾向于产生更平滑的反射光谱的观察。Mallett和Yuksel（2019）提出了一个令人惊讶的结果，表明三个精心选择的光谱的线性插值可以完全覆盖sRGB色域，尽管在平滑度方面有一些代价。Meng等人（2015）基于色度的 空间的密集采样优化了高度平滑的光谱插值，使其使用独立于任何特定的RGB色域。

The method described in Section 4.6.6 was developed by Jakob and Hanika (2019). Several properties motivated its choice in pbrt: the spectral representation is based on a smooth function family with 3 parameters (i.e., the same dimension as an RGB). Conversion can then occur in two steps: a preprocessing step (e.g., per texel) replaces RGB values with polynomial coefficients, while the performance-critical evaluation at render time only requires a few floating-point instructions. Jung et al. (2019) extended this approach, using fluorescence to permit conversion of highly saturated RGB values that cannot be recreated using reflection alone.
第4.6.6节中描述的方法由Jakob和Hanika（2019）开发。几个属性促使其在 pbrt 中的选择：谱表示基于具有3个参数的平滑函数族（即，与RGB相同的尺寸）。然后可以在两个步骤中进行转换：预处理步骤（例如，每纹素）用多项式系数替换RGB值，而渲染时的性能关键评估仅需要几个浮点指令。Jung等人（2019）扩展了这种方法，使用荧光来转换高度饱和的RGB值，这些值无法单独使用反射来重建。

Peters et al. (2019) proposed a powerful parameterization of smooth reflectance spectra in terms of Fourier coefficients. Instead of using them in a truncated Fourier series, which would suffer from ringing, they built on the theory of moments to reconstruct smooth and energy-conserving spectra.
Peters等人。（2019）提出了一种在傅立叶系数方面对平滑反射光谱的强大参数化。他们没有在截断的傅里叶级数中使用它们，因为这会受到振铃的影响，而是建立在矩理论的基础上来重建平滑和节能的光谱。

The previous methods all incorporated smoothness as a central design constraint. While natural spectra indeed often tend to be smooth, maximally smooth spectra are not necessarily the most natural, especially when more information about the underlying type of material is available. Otsu et al. (2018b) processed a large database of measured spectra, using principal component analysis to create a data-driven interpolant. Tódová et al. (2021) built on the moment-based method by Peters et al. (2019) to precompute an efficient spectral interpolant that is designed to reproduce user-specified spectra for certain RGB inputs.
以前的方法都将平滑度作为中心设计约束。虽然自然光谱确实往往是平滑的，但最大平滑光谱并不一定是最自然的，尤其是当可以获得有关底层材料类型的更多信息时。大津等人（2018 b）使用主成分分析处理了测量光谱的大型数据库，以创建数据驱动的插值。Tódová et al.（2021）基于Peters et al.（2019）的基于矩的方法来预先计算一个有效的光谱插值，该插值旨在为某些RGB输入重现用户指定的光谱。