== Further Reading
In his seminal Sketchpad system, Sutherland (1963) was the first to use projection matrices for computer graphics. Akenine-Möller et al. (2018) have provided a particularly well-written derivation of the orthographic and perspective projection matrices. Other good references for projections are Rogers and Adams’s Mathematical Elements for Computer Graphics (1990) and Eberly’s book (2001) on game engine design. See Adams and Levoy (2007) for a broad analysis of the types of radiance measurements that can be taken with cameras that have non-pinhole apertures.
Sutherland ( 1963 ) 在其开创性的画板系统中第一个将投影矩阵用于计算机图形学。 Akenine-Möller 等人。 ( 2018 ) 提供了一个写得特别好的正交和透视投影矩阵的推导。其他不错的投影参考资料包括 Rogers 和 Adams 的《计算机图形学数学原理》 （ 1990 年）和 Eberly 的关于游戏引擎设计的书（ 2001 年）。请参阅 Adams 和 Levoy ( 2007 )，了解可使用具有非针孔光圈的相机进行的辐射测量类型的广泛分析。

An unusual projection method was used by Greene and Heckbert (1986) for generating images for OMNIMAX® theaters.
Greene 和 Heckbert ( 1986 ) 使用一种不寻常的投影方法为 OMNIMAX® 剧院生成图像。

Potmesil and Chakravarty (1981, 1982, 1983) did early work on depth of field and motion blur in computer graphics. Cook and collaborators developed a more accurate model for these effects based on the thin lens model; this is the approach used for the depth of field calculations in Section 5.2.3 (Cook et al. 1984; Cook 1986). An alternative approach to motion blur was described by Gribel and Akenine-Möller (2017), who analytically computed the time ranges of ray–triangle intersections to eliminate stochastic sampling in time.
Potmesil 和 Chakravarty（ 1981、1982、1983 ）在计算机图形学中对景深和运动模糊进行了早期研究。库克和合作者基于薄透镜模型为这些效应开发了一个更准确的模型；这是第5.2.3节中用于计算景深的方法（ Cook 等人，1984 年； Cook 1986 年）。 Gribel 和 Akenine-Möller ( 2017 ) 描述了另一种运动模糊方法，他们分析计算了光线与三角形相交的时间范围，以消除时间上的随机采样。

Kolb, Mitchell, and Hanrahan (1995) showed how to simulate complex camera lens systems with ray tracing in order to model the imaging effects of real cameras; the RealisticCamera is based on their approach. Steinert et al. (2011) improved a number of details of this simulation, incorporating wavelength-dependent effects and accounting for both diffraction and glare. Joo et al. (2016) extended this approach to handle aspheric lenses and modeled diffraction at the aperture stop, which causes some brightening at the edges of the circle of confusion in practice. See the books by Hecht (2002) and Smith (2007) for excellent introductions to optics and lens systems.
Kolb、Mitchell 和 Hanrahan ( 1995 ) 展示了如何通过光线追踪来模拟复杂的相机镜头系统，以模拟真实相机的成像效果；这 RealisticCamera 是基于他们的方法。斯坦纳特等人。 ( 2011 ) 改进了该模拟的许多细节，纳入了波长相关效应并考虑了衍射和眩光。乔等人。 ( 2016 ) 扩展了这种方法来处理非球面透镜并模拟孔径光阑处的衍射，这在实践中会导致弥散圆边缘出现一些增亮。请参阅 Hecht ( 2002 ) 和 Smith ( 2007 ) 撰写的书籍，了解有关光学和透镜系统的精彩介绍。

Hullin et al. (2012) used polynomials to model the effect of lenses on rays passing through them; they were able to construct polynomials that approximate entire lens systems from polynomial approximations of individual lenses. This approach saves the computational expense of tracing rays through lenses, though for complex scenes, this cost is generally negligible in relation to the rest of the rendering computations. Hanika and Dachsbacher (2014) improved the accuracy of this approach and showed how to combine it with bidirectional path tracing. Schrade et al. (2016) showed good results with approximation of wide-angle lenses using sparse higher-degree polynomials.
胡林等人。 ( 2012 ) 使用多项式来模拟透镜对穿过透镜的光线的影响；他们能够根据单个镜头的多项式近似构造出近似整个镜头系统的多项式。这种方法节省了通过镜头追踪光线的计算费用，但对于复杂的场景，这种成本相对于渲染计算的其余部分通常可以忽略不计。 Hanika 和 Dachsbacher ( 2014 ) 提高了这种方法的准确性，并展示了如何将其与双向路径跟踪相结合。施拉德等人。 ( 2016 ) 使用稀疏的高次多项式对广角镜头进行近似，显示出良好的结果。

Film and Imaging 电影与影像
The film sensor model presented in Section 5.4.2 and the PixelSensor class implementation are from the PhysLight system described by Langlands and Fascione (2020). See also Chen et al. (2009), who described the implementation of a fairly complete simulation of a digital camera, including the analog-to-digital conversion and noise in the measured pixel values inherent in this process.
第5.4.2节中介绍的薄膜传感器模型和 PixelSensor 类实现来自 Langlands 和 Fascione ( 2020 ) 描述的PhysLight系统。另请参见陈等人。 ( 2009 )，他描述了对数码相机进行相当完整的模拟的实现，包括模数转换以及该过程中所测量的像素值中固有的噪声。

Filter importance sampling, as described in Section 8.8, was described in a paper by Ernst et al. (2006). This technique is also proposed in Shirley’s Ph.D. thesis (1990).
Ernst 等人的论文中描述了第8.8节中所述的过滤器重要性采样。 （ 2006 ）。 Shirley 的博士论文中也提出了这项技术。论文（ 1990 ）。

The idea of storing additional information about the properties of the visible surface in a pixel was introduced by Perlin (1985a) and Saito and Takahashi (1990), who also coined the term G-Buffer. Shade et al. (1998) introduced the generalization of storing information about all the surfaces along each camera ray and applied this representation to view interpolation, using the originally hidden surfaces to handle disocclusion.
Perlin ( 1985a ) 以及 Saito 和 Takahashi ( 1990 ) 提出了在像素中存储有关可见表面属性的附加信息的想法，他们还创造了术语G-Buffer 。阴影等人。 ( 1998 ) 引入了存储有关沿每个摄像机光线的所有表面的信息的概括，并将此表示应用于视图插值，使用最初隐藏的表面来处理去遮挡。

Celarek et al. (2019) developed techniques for evaluating sampling schemes based on computing both the expectation and variance of MSE and described approaches for evaluating error in rendered images across both pixels and frequencies.
塞拉雷克等人。 ( 2019 ) 开发了基于计算 MSE 的期望和方差来评估采样方案的技术，并描述了评估跨像素和频率的渲染图像中的误差的方法。

The sampling technique that approximates the XYZ matching curves is due to Radziszewski et al. (2009).
近似 XYZ 匹配曲线的采样技术是由 Radziszewski 等人提出的。 （ 2009 ）。

The SpectralFilm uses a representation for spectral images in the OpenEXR format that was introduced by Fichet et al. (2021).
这 SpectralFilm 使用 Fichet 等人引入的 OpenEXR 格式的光谱图像表示形式。 （ 2021 ）。

As discussed in Section 5.4.2, the human visual system generally factors out the illumination color to perceive surfaces’ colors independently of it. A number of methods have been developed to process photographs to perform white balancing to eliminate the tinge of light source colors; see Gijsenij et al. (2011) for a survey. White balancing photographs can be challenging, since the only information available to white balancing algorithms is the final pixel values. In a renderer, the problem is easier, as information about the light sources is directly available; Wilkie and Weidlich (2009) developed an efficient method to perform accurate white balancing in a renderer.
正如第5.4.2节中所讨论的，人类视觉系统通常会分解照明颜色来独立地感知表面颜色。已经开发出多种方法来处理照片以执行白平衡以消除光源颜色的色调；参见 Gijsenij 等人。 （ 2011 ）进行了一项调查。白平衡照片可能具有挑战性，因为白平衡算法可用的唯一信息是最终像素值。在渲染器中，问题更容易，因为有关光源的信息可以直接获得。 Wilkie 和 Weidlich ( 2009 ) 开发了一种在渲染器中执行精确白平衡的有效方法。

Denoising 去噪
A wide range of approaches have been developed for removing Monte Carlo noise from rendered images. Here we will discuss those that are based on the statistical characteristics of the sample values themselves. In the “Further Reading” section of Chapter 8, we will discuss ones that derive filters that account for the underlying light transport equations used to form the image. Zwicker et al.’s report (2015) has thorough coverage of both approaches to denoising through 2015. We will therefore focus here on some of the foundational work as well as more recent developments.
人们已经开发了多种方法来从渲染图像中消除蒙特卡洛噪声。这里我们将讨论基于样本值本身的统计特征的那些。在第8章的“扩展阅读”部分中，我们将讨论导出滤波器的滤波器，这些滤波器解释了用于形成图像的基础光传输方程。 Zwicker 等人的报告（ 2015 ）全面涵盖了 2015 年的两种去噪方法。因此，我们将在此重点关注一些基础工作以及最新的进展。

Lee and Redner (1990) suggested using an alpha-trimmed mean filter for this task; it discards some number of samples at the low and high range of the sample values. The median filter, where all but a single sample are discarded, is a special case of it. Jensen and Christensen (1995) observed that it can be effective to separate out the contributions to pixel values based on the type of illumination they represent; low-frequency indirect illumination can be filtered differently from high-frequency direct illumination, thus reducing noise in the final image. They developed an effective filtering technique based on this observation.
Lee 和 Redner ( 1990 ) 建议使用 alpha 修剪均值滤波器来完成此任务；它会丢弃样本值低范围和高范围内的一些样本。中值滤波器是其中的一个特例，其中除了单个样本之外的所有样本都被丢弃。 Jensen 和 Christensen（ 1995 ）观察到，根据像素值所代表的照明类型来分离对像素值的贡献是有效的；低频间接照明可以与高频直接照明不同地进行过滤，从而减少最终图像中的噪声。他们根据这一观察开发了一种有效的过滤技术。

McCool (1999) used the depth, surface normal, and color at each pixel to determine how to blend pixel values with their neighbors in order to better preserve edges in the filtered image. Keller and collaborators introduced the discontinuity buffer (Keller 1998; Wald et al. 2002). In addition to filtering slowly varying quantities like indirect illumination separately from more quickly varying quantities like surface reflectance, the discontinuity buffer also uses geometric quantities like the surface normal to determine filter extents.
McCool ( 1999 ) 使用每个像素的深度、表面法线和颜色来确定如何将像素值与其相邻像素值混合，以便更好地保留滤波图像中的边缘。 Keller 和合作者引入了不连续缓冲区（Keller 1998 ；Wald 等人2002 ）。除了分别过滤缓慢变化的量（如间接照明）和快速变化的量（如表面反射率）之外，不连续性缓冲区还使用几何量（如表面法线）来确定过滤范围。

Dammertz et al. (2010) introduced a denoising algorithm based on edge-aware image filtering, applied hierarchically so that very wide kernels can be used with good performance. This approach was improved by Schied et al. (2017), who used estimates of variance at each pixel to set filter widths and incorporated temporal reuse, using filtered results from the previous frame in a real-time ray tracer. Bitterli et al. (2016) analyzed a variety of previous denoising techniques in a unified framework and derived a new approach based on a first-order regression of pixel values. Boughida and Boubekeur (2017) described a Bayesian approach based on statistics of all the samples in a pixel, and Vicini et al. (2019a) considered the problem of denoising “deep” images, where each pixel may contain multiple color values, each at a different depth.
达默茨等人。 ( 2010 ) 引入了一种基于边缘感知图像过滤的去噪算法，分层应用，以便可以使用非常宽的内核并具有良好的性能。 Schied 等人改进了这种方法。 ( 2017 )，他使用每个像素的方差估计来设置滤波器宽度并结合时间重用，使用实时光线追踪器中前一帧的滤波结果。比特利等人。 ( 2016 )在统一框架中分析了以前的各种去噪技术，并得出了一种基于像素值一阶回归的新方法。 Boughida 和 Boubekeur ( 2017 ) 描述了一种基于像素中所有样本统计的贝叶斯方法，Vicini 等人。 （ 2019a ）考虑了“深度”图像的去噪问题，其中每个像素可能包含多个颜色值，每个颜色值位于不同的深度。

Some filtering techniques focus solely on the outlier pixels that result when the sampling probability in the Monte Carlo estimator is a poor match to the integrand and is far too small for a sample. (As mentioned previously, the resulting pixels are sometimes called “fireflies,” in a nod to their bright transience.) Rushmeier and Ward (1994) developed an early technique to address this issue based on detecting outlier pixels and spreading their energy to nearby pixels in order to maintain an unbiased estimate of the true image. DeCoro et al. (2010) suggested storing all pixel sample values and then rejecting outliers before filtering them to compute final pixel values. Zirr et al. (2018) proposed an improved approach that uses the distribution of sample values at each pixel to detect and reweight outlier samples. Notably, their approach does not need to store all the individual samples, but can be implemented by partitioning samples into one of a small number of image buffers based on their magnitude. More recently, Buisine et al. (2021) proposed using a median of means filter, which is effective at removing outliers but has slower convergence than the mean. They therefore dynamically select between the mean and median of means depending on the characteristics of the sample values.
一些过滤技术仅关注当蒙特卡洛估计器中的采样概率与被积函数匹配不佳并且对于样本来说太小时产生的离群像素。 （如前所述，生成的像素有时被称为“萤火虫”，以表彰其明亮的瞬态。）Rushmeier 和 Ward ( 1994 ) 开发了一种早期技术来解决这个问题，该技术基于检测离群像素并将其能量传播到附近的像素为了保持对真实图像的无偏估计。德科罗等人。 ( 2010 )建议存储所有像素样本值，然后在过滤异常值以计算最终像素值之前拒绝异常值。齐尔等人。 ( 2018 )提出了一种改进的方法，该方法使用每个像素处的样本值的分布来检测和重新加权离群样本。值得注意的是，他们的方法不需要存储所有单独的样本，而是可以通过根据样本的大小将样本划分到少量图像缓冲区之一来实现。最近，Buisine 等人。 ( 2021 )提出使用均值滤波器的中值，它可以有效地去除异常值，但收敛速度比均值慢。因此，他们根据样本值的特征在平均值和中位数之间动态选择。

As with many other areas of image processing and understanding, techniques based on machine learning have recently been applied to denoising rendered images. This work started with Kalantari et al. (2015), who used relatively small neural networks to determine parameters for conventional denoising filters. Approaches based on deep learning and convolutional neural networks soon followed with Bako et al. (2017), Chaitanya et al. (2017), and Vogels et al. (2018) developing autoencoders based on the u-net architecture (Ronneberger et al. 2015). Xu et al. (2019) applied adversarial networks to improve the training of such denoisers. Gharbi et al. (2019) showed that filtering the individual samples with a neural network can give much better results than sampling the pixels with the samples already averaged. Munkberg and Hasselgren (2020) described an architecture that reduces the memory and computation required for this approach.
与图像处理和理解的许多其他领域一样，基于机器学习的技术最近已应用于对渲染图像进行去噪。这项工作始于 Kalantari 等人。 ( 2015 )，他使用相对较小的神经网络来确定传统去噪滤波器的参数。 Bako 等人很快提出了基于深度学习和卷积神经网络的方法。 （ 2017 ），Chaitanya 等人。 （ 2017 ）和沃格尔斯等人。 ( 2018 ) 开发基于 u-net 架构的自动编码器 ( Ronneberger et al. 2015 )。徐等人。 ( 2019 ) 应用对抗网络来改进此类降噪器的训练。加尔比等人。 （ 2019 ）表明，使用神经网络过滤各个样本可以比使用已平均的样本对像素进行采样得到更好的结果。 Munkberg 和 Hasselgren ( 2020 ) 描述了一种减少这种方法所需的内存和计算的架构。