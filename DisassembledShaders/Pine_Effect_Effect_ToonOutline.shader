//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Pine/Effect/Effect_ToonOutline" {
    Properties {
        _OutlineColor ("OutlineColor", Color) = (0,0,0,0)
        _OutlineWidth ("OutlineWidth", Float) = 1
        _DisolveMap ("DisolveMap", 2D) = "white" { }
        _DisolveColor ("DisolveColor", Color) = (1,1,1,1)
        _DisolveColorWidth ("DisolveColorWidth", Range(0, 1)) = 0
        _DisolveRate ("DisolveRate", Range(0, 1)) = 1
        _CastShadows ("_CastShadows", Float) = 0
        _Surface ("_Surface", Float) = 0
        _Blend ("_Blend", Float) = 0
        _AlphaClip ("_AlphaClip", Float) = 1
        _SrcBlend ("_SrcBlend", Float) = 1
        _DstBlend ("_DstBlend", Float) = 0
        [ToggleUI] _ZWrite ("_ZWrite", Float) = 1
        _ZWriteControl ("_ZWriteControl", Float) = 0
        _ZTest ("_ZTest", Float) = 4
        _Cull ("_Cull", Float) = 1
        _QueueOffset ("_QueueOffset", Float) = 0
        _QueueControl ("_QueueControl", Float) = -1
        unity_Lightmaps ("unity_Lightmaps", 2DArray) = "" { }
        unity_LightmapsInd ("unity_LightmapsInd", 2DArray) = "" { }
        unity_ShadowMasks ("unity_ShadowMasks", 2DArray) = "" { }
    }
    SubShader {
        Tags { "QUEUE" = "AlphaTest" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderGraphShader" = "true" "ShaderGraphTargetId" = "UniversalUnlitSubTarget" "UniversalMaterialType" = "Unlit" }
        Pass {
            Name "Universal Forward"
            Tags { "QUEUE" = "AlphaTest" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderGraphShader" = "true" "ShaderGraphTargetId" = "UniversalUnlitSubTarget" "UniversalMaterialType" = "Unlit" }
            Blend Zero Zero, Zero Zero
            ZTest Off
            ZWrite Off
            Cull Off
            GpuProgramID 65351
            PlayerProgram "vp" {
                SubProgram "metal " {
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    struct VGlobals_Type
                    {
                        float3 _WorldSpaceCameraPos;
                        float4 unity_OrthoParams;
                        float4 hlslcc_mtx4x4unity_MatrixV[4];
                        float4 hlslcc_mtx4x4unity_MatrixVP[4];
                    };
                    
                    struct UnityPerDraw_Type
                    {
                        float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
                        float4 hlslcc_mtx4x4unity_WorldToObject[4];
                        float4 unity_LODFade;
                        half4 unity_WorldTransformParams;
                        float4 unity_RenderingLayer;
                        half4 unity_LightData;
                        half4 unity_LightIndices[2];
                        float4 unity_ProbesOcclusion;
                        half4 unity_SpecCube0_HDR;
                        half4 unity_SpecCube1_HDR;
                        float4 unity_SpecCube0_BoxMax;
                        float4 unity_SpecCube0_BoxMin;
                        float4 unity_SpecCube0_ProbePosition;
                        float4 unity_SpecCube1_BoxMax;
                        float4 unity_SpecCube1_BoxMin;
                        float4 unity_SpecCube1_ProbePosition;
                        float4 unity_LightmapST;
                        float4 unity_DynamicLightmapST;
                        half4 unity_SHAr;
                        half4 unity_SHAg;
                        half4 unity_SHAb;
                        half4 unity_SHBr;
                        half4 unity_SHBg;
                        half4 unity_SHBb;
                        half4 unity_SHC;
                        float4 hlslcc_mtx4x4unity_MatrixPreviousM[4];
                        float4 hlslcc_mtx4x4unity_MatrixPreviousMI[4];
                        float4 unity_MotionVectorsParams;
                    };
                    
                    struct UnityPerMaterial_Type
                    {
                        float4 _OutlineColor;
                        float _OutlineWidth;
                        float4 _DisolveMap_TexelSize;
                        float _DisolveColorWidth;
                        float _DisolveRate;
                        float4 _DisolveColor;
                    };
                    
                    struct Mtl_VertexIn
                    {
                        float3 POSITION0 [[ attribute(0) ]] ;
                        float3 NORMAL0 [[ attribute(1) ]] ;
                        float4 TEXCOORD0 [[ attribute(2) ]] ;
                        float4 COLOR0 [[ attribute(3) ]] ;
                    };
                    
                    struct Mtl_VertexOut
                    {
                        float4 mtl_Position [[ position, invariant ]];
                        float4 INTERP0 [[ user(INTERP0) ]];
                        float4 INTERP1 [[ user(INTERP1) ]];
                        float3 INTERP2 [[ user(INTERP2) ]];
                        float3 INTERP3 [[ user(INTERP3) ]];
                        float3 INTERP4 [[ user(INTERP4) ]];
                    };
                    
                    vertex Mtl_VertexOut xlatMtlMain(
                        constant VGlobals_Type& VGlobals [[ buffer(0) ]],
                        constant UnityPerDraw_Type& UnityPerDraw [[ buffer(1) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(2) ]],
                        Mtl_VertexIn input [[ stage_in ]])
                    {
                        Mtl_VertexOut output;
                        float4 u_xlat0;
                        float4 u_xlat1;
                        float u_xlat6;
                        bool u_xlatb6;
                        u_xlat0.x = dot(input.NORMAL0.xyz, input.NORMAL0.xyz);
                        u_xlat0.x = rsqrt(u_xlat0.x);
                        u_xlat0.xyz = u_xlat0.xxx * input.NORMAL0.xyz;
                        u_xlat6 = UnityPerMaterial._OutlineWidth * 0.00999999978;
                        u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat6), input.POSITION0.xyz);
                        u_xlat1.xyz = u_xlat0.yyy * UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
                        u_xlat0.xyw = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, u_xlat0.xxx, u_xlat1.xyz);
                        u_xlat0.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, u_xlat0.zzz, u_xlat0.xyw);
                        u_xlat0.xyz = u_xlat0.xyz + UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
                        u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
                        u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
                        u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
                        output.mtl_Position = u_xlat1 + VGlobals.hlslcc_mtx4x4unity_MatrixVP[3];
                        output.INTERP0 = input.TEXCOORD0;
                        output.INTERP1 = input.COLOR0;
                        output.INTERP2.xyz = u_xlat0.xyz;
                        u_xlat0.xyz = (-u_xlat0.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
                        u_xlat1.x = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
                        u_xlat1.y = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
                        u_xlat1.z = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
                        u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
                        u_xlat6 = max(u_xlat6, 1.17549435e-38);
                        u_xlat6 = rsqrt(u_xlat6);
                        output.INTERP3.xyz = float3(u_xlat6) * u_xlat1.xyz;
                        u_xlatb6 = VGlobals.unity_OrthoParams.w==0.0;
                        output.INTERP4.x = (u_xlatb6) ? u_xlat0.x : VGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
                        output.INTERP4.y = (u_xlatb6) ? u_xlat0.y : VGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
                        output.INTERP4.z = (u_xlatb6) ? u_xlat0.z : VGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
                        return output;
                    }
                    "
                }
            }
            PlayerProgram "fp" {
                SubProgram "metal " {
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    #ifndef XLT_REMAP_O
                    	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
                    #endif
                    constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
                    struct FGlobals_Type
                    {
                        float2 _GlobalMipBias;
                    };
                    
                    struct UnityPerMaterial_Type
                    {
                        float4 _OutlineColor;
                        float _OutlineWidth;
                        float4 _DisolveMap_TexelSize;
                        float _DisolveColorWidth;
                        float _DisolveRate;
                        float4 _DisolveColor;
                    };
                    
                    struct Mtl_FragmentIn
                    {
                        float4 INTERP0 [[ user(INTERP0) ]] ;
                        float4 INTERP1 [[ user(INTERP1) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        half4 SV_TARGET0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    fragment Mtl_FragmentOut xlatMtlMain(
                        constant FGlobals_Type& FGlobals [[ buffer(0) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(1) ]],
                        sampler sampler_DisolveMap [[ sampler (0) ]],
                        texture2d<half, access::sample > _DisolveMap [[ texture(0) ]] ,
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        float3 u_xlat0;
                        float3 u_xlat1;
                        half4 u_xlat16_1;
                        float3 u_xlat2;
                        u_xlat0.x = fma((-UnityPerMaterial._DisolveRate), input.INTERP1.w, 1.0);
                        u_xlat0.x = fma(u_xlat0.x, UnityPerMaterial._DisolveColorWidth, u_xlat0.x);
                        u_xlat2.x = u_xlat0.x + -0.00999999978;
                        u_xlat0.x = (-u_xlat2.x) + u_xlat0.x;
                        u_xlat0.x = float(1.0) / u_xlat0.x;
                        u_xlat16_1 = _DisolveMap.sample(sampler_DisolveMap, input.INTERP0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                        u_xlat2.x = (-u_xlat2.x) + float(u_xlat16_1.w);
                        u_xlat0.x = u_xlat0.x * u_xlat2.x;
                        u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
                        u_xlat2.x = fma(u_xlat0.x, -2.0, 3.0);
                        u_xlat0.x = u_xlat0.x * u_xlat0.x;
                        u_xlat0.x = u_xlat0.x * u_xlat2.x;
                        u_xlat2.xyz = float3(u_xlat16_1.xyz) * UnityPerMaterial._DisolveColor.xyz;
                        u_xlat1.xyz = fma((-UnityPerMaterial._DisolveColor.xyz), float3(u_xlat16_1.xyz), UnityPerMaterial._OutlineColor.xyz);
                        u_xlat0.xyz = fma(u_xlat0.xxx, u_xlat1.xyz, u_xlat2.xyz);
                        output.SV_TARGET0.xyz = half3(u_xlat0.xyz);
                        output.SV_TARGET0.w = half(1.0);
                        return output;
                    }
                    "
                }
                SubProgram "metal " {
                    Keywords { "_ALPHATEST_ON" }
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    #ifndef XLT_REMAP_O
                    	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
                    #endif
                    constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
                    struct FGlobals_Type
                    {
                        float2 _GlobalMipBias;
                    };
                    
                    struct UnityPerMaterial_Type
                    {
                        float4 _OutlineColor;
                        float _OutlineWidth;
                        float4 _DisolveMap_TexelSize;
                        float _DisolveColorWidth;
                        float _DisolveRate;
                        float4 _DisolveColor;
                    };
                    
                    struct Mtl_FragmentIn
                    {
                        float4 INTERP0 [[ user(INTERP0) ]] ;
                        float4 INTERP1 [[ user(INTERP1) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        half4 SV_TARGET0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    fragment Mtl_FragmentOut xlatMtlMain(
                        constant FGlobals_Type& FGlobals [[ buffer(0) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(1) ]],
                        sampler sampler_DisolveMap [[ sampler (0) ]],
                        texture2d<half, access::sample > _DisolveMap [[ texture(0) ]] ,
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        float u_xlat0;
                        bool u_xlatb0;
                        float3 u_xlat1;
                        half4 u_xlat16_1;
                        float4 u_xlat2;
                        float3 u_xlat3;
                        u_xlat0 = input.INTERP1.w * UnityPerMaterial._DisolveRate;
                        u_xlat3.x = fma((-UnityPerMaterial._DisolveRate), input.INTERP1.w, 1.0);
                        u_xlat0 = fma((-u_xlat0), UnityPerMaterial._DisolveColorWidth, u_xlat3.x);
                        u_xlat3.x = fma(u_xlat3.x, UnityPerMaterial._DisolveColorWidth, u_xlat3.x);
                        u_xlat16_1 = _DisolveMap.sample(sampler_DisolveMap, input.INTERP0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                        u_xlatb0 = float(u_xlat16_1.w)>=u_xlat0;
                        if(((int(u_xlatb0) * int(0xffffffffu)))==0){discard_fragment();}
                        u_xlat2.w = u_xlatb0 ? 1.0 : float(0.0);
                        u_xlat0 = u_xlat3.x + -0.00999999978;
                        u_xlat3.x = (-u_xlat0) + u_xlat3.x;
                        u_xlat0 = (-u_xlat0) + float(u_xlat16_1.w);
                        u_xlat3.x = float(1.0) / u_xlat3.x;
                        u_xlat0 = u_xlat3.x * u_xlat0;
                        u_xlat0 = clamp(u_xlat0, 0.0f, 1.0f);
                        u_xlat3.x = fma(u_xlat0, -2.0, 3.0);
                        u_xlat0 = u_xlat0 * u_xlat0;
                        u_xlat0 = u_xlat0 * u_xlat3.x;
                        u_xlat3.xyz = float3(u_xlat16_1.xyz) * UnityPerMaterial._DisolveColor.xyz;
                        u_xlat1.xyz = fma((-UnityPerMaterial._DisolveColor.xyz), float3(u_xlat16_1.xyz), UnityPerMaterial._OutlineColor.xyz);
                        u_xlat2.xyz = fma(float3(u_xlat0), u_xlat1.xyz, u_xlat3.xyz);
                        output.SV_TARGET0 = half4(u_xlat2);
                        return output;
                    }
                    "
                }
            }
        }
        Pass {
            Name "DepthOnly"
            Tags { "LIGHTMODE" = "DepthOnly" "QUEUE" = "AlphaTest" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderGraphShader" = "true" "ShaderGraphTargetId" = "UniversalUnlitSubTarget" "UniversalMaterialType" = "Unlit" }
            ColorMask 0 0
            Cull Off
            GpuProgramID 94140
            PlayerProgram "vp" {
                SubProgram "metal " {
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    struct VGlobals_Type
                    {
                        float4 hlslcc_mtx4x4unity_MatrixVP[4];
                    };
                    
                    struct UnityPerDraw_Type
                    {
                        float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
                        float4 hlslcc_mtx4x4unity_WorldToObject[4];
                        float4 unity_LODFade;
                        half4 unity_WorldTransformParams;
                        float4 unity_RenderingLayer;
                        half4 unity_LightData;
                        half4 unity_LightIndices[2];
                        float4 unity_ProbesOcclusion;
                        half4 unity_SpecCube0_HDR;
                        half4 unity_SpecCube1_HDR;
                        float4 unity_SpecCube0_BoxMax;
                        float4 unity_SpecCube0_BoxMin;
                        float4 unity_SpecCube0_ProbePosition;
                        float4 unity_SpecCube1_BoxMax;
                        float4 unity_SpecCube1_BoxMin;
                        float4 unity_SpecCube1_ProbePosition;
                        float4 unity_LightmapST;
                        float4 unity_DynamicLightmapST;
                        half4 unity_SHAr;
                        half4 unity_SHAg;
                        half4 unity_SHAb;
                        half4 unity_SHBr;
                        half4 unity_SHBg;
                        half4 unity_SHBb;
                        half4 unity_SHC;
                        float4 hlslcc_mtx4x4unity_MatrixPreviousM[4];
                        float4 hlslcc_mtx4x4unity_MatrixPreviousMI[4];
                        float4 unity_MotionVectorsParams;
                    };
                    
                    struct UnityPerMaterial_Type
                    {
                        float4 _OutlineColor;
                        float _OutlineWidth;
                        float4 _DisolveMap_TexelSize;
                        float _DisolveColorWidth;
                        float _DisolveRate;
                        float4 _DisolveColor;
                    };
                    
                    struct Mtl_VertexIn
                    {
                        float3 POSITION0 [[ attribute(0) ]] ;
                        float3 NORMAL0 [[ attribute(1) ]] ;
                        float4 TEXCOORD0 [[ attribute(2) ]] ;
                        float4 COLOR0 [[ attribute(3) ]] ;
                    };
                    
                    struct Mtl_VertexOut
                    {
                        float4 mtl_Position [[ position, invariant ]];
                        float4 INTERP0 [[ user(INTERP0) ]];
                        float4 INTERP1 [[ user(INTERP1) ]];
                    };
                    
                    vertex Mtl_VertexOut xlatMtlMain(
                        constant VGlobals_Type& VGlobals [[ buffer(0) ]],
                        constant UnityPerDraw_Type& UnityPerDraw [[ buffer(1) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(2) ]],
                        Mtl_VertexIn input [[ stage_in ]])
                    {
                        Mtl_VertexOut output;
                        float4 u_xlat0;
                        float4 u_xlat1;
                        float u_xlat6;
                        u_xlat0.x = dot(input.NORMAL0.xyz, input.NORMAL0.xyz);
                        u_xlat0.x = rsqrt(u_xlat0.x);
                        u_xlat0.xyz = u_xlat0.xxx * input.NORMAL0.xyz;
                        u_xlat6 = UnityPerMaterial._OutlineWidth * 0.00999999978;
                        u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat6), input.POSITION0.xyz);
                        u_xlat1.xyz = u_xlat0.yyy * UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
                        u_xlat0.xyw = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, u_xlat0.xxx, u_xlat1.xyz);
                        u_xlat0.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, u_xlat0.zzz, u_xlat0.xyw);
                        u_xlat0.xyz = u_xlat0.xyz + UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
                        u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
                        u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
                        u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
                        output.mtl_Position = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_MatrixVP[3];
                        output.INTERP0 = input.TEXCOORD0;
                        output.INTERP1 = input.COLOR0;
                        return output;
                    }
                    "
                }
            }
            PlayerProgram "fp" {
                SubProgram "metal " {
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    #ifndef XLT_REMAP_O
                    	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
                    #endif
                    constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
                    struct Mtl_FragmentOut
                    {
                        half4 SV_TARGET0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    fragment Mtl_FragmentOut xlatMtlMain(
                    )
                    {
                        Mtl_FragmentOut output;
                        output.SV_TARGET0 = half4(0.0, 0.0, 0.0, 0.0);
                        return output;
                    }
                    "
                }
                SubProgram "metal " {
                    Keywords { "_ALPHATEST_ON" }
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    #ifndef XLT_REMAP_O
                    	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
                    #endif
                    constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
                    struct FGlobals_Type
                    {
                        float2 _GlobalMipBias;
                    };
                    
                    struct UnityPerMaterial_Type
                    {
                        float4 _OutlineColor;
                        float _OutlineWidth;
                        float4 _DisolveMap_TexelSize;
                        float _DisolveColorWidth;
                        float _DisolveRate;
                        float4 _DisolveColor;
                    };
                    
                    struct Mtl_FragmentIn
                    {
                        float4 INTERP0 [[ user(INTERP0) ]] ;
                        float4 INTERP1 [[ user(INTERP1) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        half4 SV_TARGET0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    fragment Mtl_FragmentOut xlatMtlMain(
                        constant FGlobals_Type& FGlobals [[ buffer(0) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(1) ]],
                        sampler sampler_DisolveMap [[ sampler (0) ]],
                        texture2d<half, access::sample > _DisolveMap [[ texture(0) ]] ,
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        float u_xlat0;
                        bool u_xlatb0;
                        float u_xlat1;
                        u_xlat0 = input.INTERP1.w * UnityPerMaterial._DisolveRate;
                        u_xlat1 = fma((-UnityPerMaterial._DisolveRate), input.INTERP1.w, 1.0);
                        u_xlat0 = fma((-u_xlat0), UnityPerMaterial._DisolveColorWidth, u_xlat1);
                        u_xlat1 = float(_DisolveMap.sample(sampler_DisolveMap, input.INTERP0.xy, bias(FGlobals._GlobalMipBias.xyxx.x)).w);
                        u_xlatb0 = u_xlat1>=u_xlat0;
                        if(((int(u_xlatb0) * int(0xffffffffu)))==0){discard_fragment();}
                        output.SV_TARGET0 = half4(0.0, 0.0, 0.0, 0.0);
                        return output;
                    }
                    "
                }
            }
        }
        Pass {
            Name "DepthNormalsOnly"
            Tags { "LIGHTMODE" = "DepthNormalsOnly" "QUEUE" = "AlphaTest" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderGraphShader" = "true" "ShaderGraphTargetId" = "UniversalUnlitSubTarget" "UniversalMaterialType" = "Unlit" }
            Cull Off
            GpuProgramID 161873
            PlayerProgram "vp" {
                SubProgram "metal " {
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    struct VGlobals_Type
                    {
                        float4 hlslcc_mtx4x4unity_MatrixVP[4];
                    };
                    
                    struct UnityPerDraw_Type
                    {
                        float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
                        float4 hlslcc_mtx4x4unity_WorldToObject[4];
                        float4 unity_LODFade;
                        half4 unity_WorldTransformParams;
                        float4 unity_RenderingLayer;
                        half4 unity_LightData;
                        half4 unity_LightIndices[2];
                        float4 unity_ProbesOcclusion;
                        half4 unity_SpecCube0_HDR;
                        half4 unity_SpecCube1_HDR;
                        float4 unity_SpecCube0_BoxMax;
                        float4 unity_SpecCube0_BoxMin;
                        float4 unity_SpecCube0_ProbePosition;
                        float4 unity_SpecCube1_BoxMax;
                        float4 unity_SpecCube1_BoxMin;
                        float4 unity_SpecCube1_ProbePosition;
                        float4 unity_LightmapST;
                        float4 unity_DynamicLightmapST;
                        half4 unity_SHAr;
                        half4 unity_SHAg;
                        half4 unity_SHAb;
                        half4 unity_SHBr;
                        half4 unity_SHBg;
                        half4 unity_SHBb;
                        half4 unity_SHC;
                        float4 hlslcc_mtx4x4unity_MatrixPreviousM[4];
                        float4 hlslcc_mtx4x4unity_MatrixPreviousMI[4];
                        float4 unity_MotionVectorsParams;
                    };
                    
                    struct UnityPerMaterial_Type
                    {
                        float4 _OutlineColor;
                        float _OutlineWidth;
                        float4 _DisolveMap_TexelSize;
                        float _DisolveColorWidth;
                        float _DisolveRate;
                        float4 _DisolveColor;
                    };
                    
                    struct Mtl_VertexIn
                    {
                        float3 POSITION0 [[ attribute(0) ]] ;
                        float3 NORMAL0 [[ attribute(1) ]] ;
                        float4 TANGENT0 [[ attribute(2) ]] ;
                        float4 TEXCOORD0 [[ attribute(3) ]] ;
                        float4 COLOR0 [[ attribute(4) ]] ;
                    };
                    
                    struct Mtl_VertexOut
                    {
                        float4 mtl_Position [[ position, invariant ]];
                        float4 INTERP0 [[ user(INTERP0) ]];
                        float4 INTERP1 [[ user(INTERP1) ]];
                        float4 INTERP2 [[ user(INTERP2) ]];
                        float3 INTERP3 [[ user(INTERP3) ]];
                    };
                    
                    vertex Mtl_VertexOut xlatMtlMain(
                        constant VGlobals_Type& VGlobals [[ buffer(0) ]],
                        constant UnityPerDraw_Type& UnityPerDraw [[ buffer(1) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(2) ]],
                        Mtl_VertexIn input [[ stage_in ]])
                    {
                        Mtl_VertexOut output;
                        float4 u_xlat0;
                        float4 u_xlat1;
                        float u_xlat6;
                        u_xlat0.x = dot(input.NORMAL0.xyz, input.NORMAL0.xyz);
                        u_xlat0.x = rsqrt(u_xlat0.x);
                        u_xlat0.xyz = u_xlat0.xxx * input.NORMAL0.xyz;
                        u_xlat6 = UnityPerMaterial._OutlineWidth * 0.00999999978;
                        u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat6), input.POSITION0.xyz);
                        u_xlat1.xyz = u_xlat0.yyy * UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
                        u_xlat0.xyw = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, u_xlat0.xxx, u_xlat1.xyz);
                        u_xlat0.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, u_xlat0.zzz, u_xlat0.xyw);
                        u_xlat0.xyz = u_xlat0.xyz + UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
                        u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
                        u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
                        u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
                        output.mtl_Position = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_MatrixVP[3];
                        u_xlat0.xyz = input.TANGENT0.yyy * UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
                        u_xlat0.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.TANGENT0.xxx, u_xlat0.xyz);
                        u_xlat0.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.TANGENT0.zzz, u_xlat0.xyz);
                        u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
                        u_xlat6 = max(u_xlat6, 1.17549435e-38);
                        u_xlat6 = rsqrt(u_xlat6);
                        output.INTERP0.xyz = float3(u_xlat6) * u_xlat0.xyz;
                        output.INTERP0.w = input.TANGENT0.w;
                        output.INTERP1 = input.TEXCOORD0;
                        output.INTERP2 = input.COLOR0;
                        u_xlat0.x = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
                        u_xlat0.y = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
                        u_xlat0.z = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
                        u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
                        u_xlat6 = max(u_xlat6, 1.17549435e-38);
                        u_xlat6 = rsqrt(u_xlat6);
                        output.INTERP3.xyz = float3(u_xlat6) * u_xlat0.xyz;
                        return output;
                    }
                    "
                }
            }
            PlayerProgram "fp" {
                SubProgram "metal " {
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    #ifndef XLT_REMAP_O
                    	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
                    #endif
                    constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
                    struct Mtl_FragmentIn
                    {
                        float3 INTERP3 [[ user(INTERP3) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        half4 SV_TARGET0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    fragment Mtl_FragmentOut xlatMtlMain(
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        float3 u_xlat0;
                        u_xlat0.x = dot(input.INTERP3.xyz, input.INTERP3.xyz);
                        u_xlat0.x = rsqrt(u_xlat0.x);
                        u_xlat0.xyz = u_xlat0.xxx * input.INTERP3.xyz;
                        output.SV_TARGET0.xyz = half3(u_xlat0.xyz);
                        output.SV_TARGET0.w = half(0.0);
                        return output;
                    }
                    "
                }
                SubProgram "metal " {
                    Keywords { "_ALPHATEST_ON" }
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    #ifndef XLT_REMAP_O
                    	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
                    #endif
                    constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
                    struct FGlobals_Type
                    {
                        float2 _GlobalMipBias;
                    };
                    
                    struct UnityPerMaterial_Type
                    {
                        float4 _OutlineColor;
                        float _OutlineWidth;
                        float4 _DisolveMap_TexelSize;
                        float _DisolveColorWidth;
                        float _DisolveRate;
                        float4 _DisolveColor;
                    };
                    
                    struct Mtl_FragmentIn
                    {
                        float4 INTERP1 [[ user(INTERP1) ]] ;
                        float4 INTERP2 [[ user(INTERP2) ]] ;
                        float3 INTERP3 [[ user(INTERP3) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        half4 SV_TARGET0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    fragment Mtl_FragmentOut xlatMtlMain(
                        constant FGlobals_Type& FGlobals [[ buffer(0) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(1) ]],
                        sampler sampler_DisolveMap [[ sampler (0) ]],
                        texture2d<half, access::sample > _DisolveMap [[ texture(0) ]] ,
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        float3 u_xlat0;
                        bool u_xlatb0;
                        float u_xlat1;
                        u_xlat0.x = input.INTERP2.w * UnityPerMaterial._DisolveRate;
                        u_xlat1 = fma((-UnityPerMaterial._DisolveRate), input.INTERP2.w, 1.0);
                        u_xlat0.x = fma((-u_xlat0.x), UnityPerMaterial._DisolveColorWidth, u_xlat1);
                        u_xlat1 = float(_DisolveMap.sample(sampler_DisolveMap, input.INTERP1.xy, bias(FGlobals._GlobalMipBias.xyxx.x)).w);
                        u_xlatb0 = u_xlat1>=u_xlat0.x;
                        if(((int(u_xlatb0) * int(0xffffffffu)))==0){discard_fragment();}
                        u_xlat0.x = dot(input.INTERP3.xyz, input.INTERP3.xyz);
                        u_xlat0.x = rsqrt(u_xlat0.x);
                        u_xlat0.xyz = u_xlat0.xxx * input.INTERP3.xyz;
                        output.SV_TARGET0.xyz = half3(u_xlat0.xyz);
                        output.SV_TARGET0.w = half(0.0);
                        return output;
                    }
                    "
                }
            }
        }
        Pass {
            Name "ShadowCaster"
            Tags { "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "AlphaTest" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderGraphShader" = "true" "ShaderGraphTargetId" = "UniversalUnlitSubTarget" "UniversalMaterialType" = "Unlit" }
            ColorMask 0 0
            Cull Off
            GpuProgramID 212092
            PlayerProgram "vp" {
                SubProgram "metal " {
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    struct VGlobals_Type
                    {
                        float4 hlslcc_mtx4x4unity_MatrixVP[4];
                        float4 _ShadowBias;
                        float3 _LightDirection;
                    };
                    
                    struct UnityPerDraw_Type
                    {
                        float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
                        float4 hlslcc_mtx4x4unity_WorldToObject[4];
                        float4 unity_LODFade;
                        half4 unity_WorldTransformParams;
                        float4 unity_RenderingLayer;
                        half4 unity_LightData;
                        half4 unity_LightIndices[2];
                        float4 unity_ProbesOcclusion;
                        half4 unity_SpecCube0_HDR;
                        half4 unity_SpecCube1_HDR;
                        float4 unity_SpecCube0_BoxMax;
                        float4 unity_SpecCube0_BoxMin;
                        float4 unity_SpecCube0_ProbePosition;
                        float4 unity_SpecCube1_BoxMax;
                        float4 unity_SpecCube1_BoxMin;
                        float4 unity_SpecCube1_ProbePosition;
                        float4 unity_LightmapST;
                        float4 unity_DynamicLightmapST;
                        half4 unity_SHAr;
                        half4 unity_SHAg;
                        half4 unity_SHAb;
                        half4 unity_SHBr;
                        half4 unity_SHBg;
                        half4 unity_SHBb;
                        half4 unity_SHC;
                        float4 hlslcc_mtx4x4unity_MatrixPreviousM[4];
                        float4 hlslcc_mtx4x4unity_MatrixPreviousMI[4];
                        float4 unity_MotionVectorsParams;
                    };
                    
                    struct UnityPerMaterial_Type
                    {
                        float4 _OutlineColor;
                        float _OutlineWidth;
                        float4 _DisolveMap_TexelSize;
                        float _DisolveColorWidth;
                        float _DisolveRate;
                        float4 _DisolveColor;
                    };
                    
                    struct Mtl_VertexIn
                    {
                        float3 POSITION0 [[ attribute(0) ]] ;
                        float3 NORMAL0 [[ attribute(1) ]] ;
                        float4 TEXCOORD0 [[ attribute(2) ]] ;
                        float4 COLOR0 [[ attribute(3) ]] ;
                    };
                    
                    struct Mtl_VertexOut
                    {
                        float4 mtl_Position [[ position, invariant ]];
                        float4 INTERP0 [[ user(INTERP0) ]];
                        float4 INTERP1 [[ user(INTERP1) ]];
                        float3 INTERP2 [[ user(INTERP2) ]];
                    };
                    
                    vertex Mtl_VertexOut xlatMtlMain(
                        constant VGlobals_Type& VGlobals [[ buffer(0) ]],
                        constant UnityPerDraw_Type& UnityPerDraw [[ buffer(1) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(2) ]],
                        Mtl_VertexIn input [[ stage_in ]])
                    {
                        Mtl_VertexOut output;
                        float4 u_xlat0;
                        float4 u_xlat1;
                        float u_xlat6;
                        u_xlat0.x = dot(input.NORMAL0.xyz, input.NORMAL0.xyz);
                        u_xlat0.x = rsqrt(u_xlat0.x);
                        u_xlat0.xyz = u_xlat0.xxx * input.NORMAL0.xyz;
                        u_xlat6 = UnityPerMaterial._OutlineWidth * 0.00999999978;
                        u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat6), input.POSITION0.xyz);
                        u_xlat1.xyz = u_xlat0.yyy * UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
                        u_xlat0.xyw = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, u_xlat0.xxx, u_xlat1.xyz);
                        u_xlat0.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, u_xlat0.zzz, u_xlat0.xyw);
                        u_xlat0.xyz = u_xlat0.xyz + UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
                        u_xlat0.xyz = fma(VGlobals._LightDirection.xyzx.xyz, VGlobals._ShadowBias.xxx, u_xlat0.xyz);
                        u_xlat1.x = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
                        u_xlat1.y = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
                        u_xlat1.z = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
                        u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
                        u_xlat6 = max(u_xlat6, 1.17549435e-38);
                        u_xlat6 = rsqrt(u_xlat6);
                        u_xlat1.xyz = float3(u_xlat6) * u_xlat1.xyz;
                        u_xlat6 = dot(VGlobals._LightDirection.xyzx.xyz, u_xlat1.xyz);
                        u_xlat6 = clamp(u_xlat6, 0.0f, 1.0f);
                        u_xlat6 = (-u_xlat6) + 1.0;
                        u_xlat6 = u_xlat6 * VGlobals._ShadowBias.y;
                        u_xlat0.xyz = fma(u_xlat1.xyz, float3(u_xlat6), u_xlat0.xyz);
                        output.INTERP2.xyz = u_xlat1.xyz;
                        u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
                        u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
                        u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
                        u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_MatrixVP[3];
                        output.mtl_Position.z = min(u_xlat0.z, 1.0);
                        output.mtl_Position.xyw = u_xlat0.xyw;
                        output.INTERP0 = input.TEXCOORD0;
                        output.INTERP1 = input.COLOR0;
                        return output;
                    }
                    "
                }
            }
            PlayerProgram "fp" {
                SubProgram "metal " {
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    #ifndef XLT_REMAP_O
                    	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
                    #endif
                    constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
                    struct Mtl_FragmentOut
                    {
                        half4 SV_TARGET0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    fragment Mtl_FragmentOut xlatMtlMain(
                    )
                    {
                        Mtl_FragmentOut output;
                        output.SV_TARGET0 = half4(0.0, 0.0, 0.0, 0.0);
                        return output;
                    }
                    "
                }
                SubProgram "metal " {
                    Keywords { "_ALPHATEST_ON" }
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    #ifndef XLT_REMAP_O
                    	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
                    #endif
                    constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
                    struct FGlobals_Type
                    {
                        float2 _GlobalMipBias;
                    };
                    
                    struct UnityPerMaterial_Type
                    {
                        float4 _OutlineColor;
                        float _OutlineWidth;
                        float4 _DisolveMap_TexelSize;
                        float _DisolveColorWidth;
                        float _DisolveRate;
                        float4 _DisolveColor;
                    };
                    
                    struct Mtl_FragmentIn
                    {
                        float4 INTERP0 [[ user(INTERP0) ]] ;
                        float4 INTERP1 [[ user(INTERP1) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        half4 SV_TARGET0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    fragment Mtl_FragmentOut xlatMtlMain(
                        constant FGlobals_Type& FGlobals [[ buffer(0) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(1) ]],
                        sampler sampler_DisolveMap [[ sampler (0) ]],
                        texture2d<half, access::sample > _DisolveMap [[ texture(0) ]] ,
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        float u_xlat0;
                        bool u_xlatb0;
                        float u_xlat1;
                        u_xlat0 = input.INTERP1.w * UnityPerMaterial._DisolveRate;
                        u_xlat1 = fma((-UnityPerMaterial._DisolveRate), input.INTERP1.w, 1.0);
                        u_xlat0 = fma((-u_xlat0), UnityPerMaterial._DisolveColorWidth, u_xlat1);
                        u_xlat1 = float(_DisolveMap.sample(sampler_DisolveMap, input.INTERP0.xy, bias(FGlobals._GlobalMipBias.xyxx.x)).w);
                        u_xlatb0 = u_xlat1>=u_xlat0;
                        if(((int(u_xlatb0) * int(0xffffffffu)))==0){discard_fragment();}
                        output.SV_TARGET0 = half4(0.0, 0.0, 0.0, 0.0);
                        return output;
                    }
                    "
                }
            }
        }
        Pass {
            Name "DepthNormals"
            Tags { "LIGHTMODE" = "DepthNormalsOnly" "QUEUE" = "AlphaTest" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderGraphShader" = "true" "ShaderGraphTargetId" = "UniversalUnlitSubTarget" "UniversalMaterialType" = "Unlit" }
            Cull Off
            GpuProgramID 449475
            PlayerProgram "vp" {
                SubProgram "metal " {
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    struct VGlobals_Type
                    {
                        float4 hlslcc_mtx4x4unity_MatrixVP[4];
                    };
                    
                    struct UnityPerDraw_Type
                    {
                        float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
                        float4 hlslcc_mtx4x4unity_WorldToObject[4];
                        float4 unity_LODFade;
                        half4 unity_WorldTransformParams;
                        float4 unity_RenderingLayer;
                        half4 unity_LightData;
                        half4 unity_LightIndices[2];
                        float4 unity_ProbesOcclusion;
                        half4 unity_SpecCube0_HDR;
                        half4 unity_SpecCube1_HDR;
                        float4 unity_SpecCube0_BoxMax;
                        float4 unity_SpecCube0_BoxMin;
                        float4 unity_SpecCube0_ProbePosition;
                        float4 unity_SpecCube1_BoxMax;
                        float4 unity_SpecCube1_BoxMin;
                        float4 unity_SpecCube1_ProbePosition;
                        float4 unity_LightmapST;
                        float4 unity_DynamicLightmapST;
                        half4 unity_SHAr;
                        half4 unity_SHAg;
                        half4 unity_SHAb;
                        half4 unity_SHBr;
                        half4 unity_SHBg;
                        half4 unity_SHBb;
                        half4 unity_SHC;
                        float4 hlslcc_mtx4x4unity_MatrixPreviousM[4];
                        float4 hlslcc_mtx4x4unity_MatrixPreviousMI[4];
                        float4 unity_MotionVectorsParams;
                    };
                    
                    struct UnityPerMaterial_Type
                    {
                        float4 _OutlineColor;
                        float _OutlineWidth;
                        float4 _DisolveMap_TexelSize;
                        float _DisolveColorWidth;
                        float _DisolveRate;
                        float4 _DisolveColor;
                    };
                    
                    struct Mtl_VertexIn
                    {
                        float3 POSITION0 [[ attribute(0) ]] ;
                        float3 NORMAL0 [[ attribute(1) ]] ;
                        float4 TEXCOORD0 [[ attribute(2) ]] ;
                        float4 COLOR0 [[ attribute(3) ]] ;
                    };
                    
                    struct Mtl_VertexOut
                    {
                        float4 mtl_Position [[ position, invariant ]];
                        float4 INTERP0 [[ user(INTERP0) ]];
                        float4 INTERP1 [[ user(INTERP1) ]];
                        float3 INTERP2 [[ user(INTERP2) ]];
                    };
                    
                    vertex Mtl_VertexOut xlatMtlMain(
                        constant VGlobals_Type& VGlobals [[ buffer(0) ]],
                        constant UnityPerDraw_Type& UnityPerDraw [[ buffer(1) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(2) ]],
                        Mtl_VertexIn input [[ stage_in ]])
                    {
                        Mtl_VertexOut output;
                        float4 u_xlat0;
                        float4 u_xlat1;
                        float u_xlat6;
                        u_xlat0.x = dot(input.NORMAL0.xyz, input.NORMAL0.xyz);
                        u_xlat0.x = rsqrt(u_xlat0.x);
                        u_xlat0.xyz = u_xlat0.xxx * input.NORMAL0.xyz;
                        u_xlat6 = UnityPerMaterial._OutlineWidth * 0.00999999978;
                        u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat6), input.POSITION0.xyz);
                        u_xlat1.xyz = u_xlat0.yyy * UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
                        u_xlat0.xyw = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, u_xlat0.xxx, u_xlat1.xyz);
                        u_xlat0.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, u_xlat0.zzz, u_xlat0.xyw);
                        u_xlat0.xyz = u_xlat0.xyz + UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
                        u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
                        u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
                        u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
                        output.mtl_Position = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_MatrixVP[3];
                        output.INTERP0 = input.TEXCOORD0;
                        output.INTERP1 = input.COLOR0;
                        u_xlat0.x = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
                        u_xlat0.y = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
                        u_xlat0.z = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
                        u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
                        u_xlat6 = max(u_xlat6, 1.17549435e-38);
                        u_xlat6 = rsqrt(u_xlat6);
                        output.INTERP2.xyz = float3(u_xlat6) * u_xlat0.xyz;
                        return output;
                    }
                    "
                }
            }
            PlayerProgram "fp" {
                SubProgram "metal " {
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    #ifndef XLT_REMAP_O
                    	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
                    #endif
                    constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
                    struct Mtl_FragmentIn
                    {
                        float3 INTERP2 [[ user(INTERP2) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        half4 SV_TARGET0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    fragment Mtl_FragmentOut xlatMtlMain(
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        float3 u_xlat0;
                        u_xlat0.x = dot(input.INTERP2.xyz, input.INTERP2.xyz);
                        u_xlat0.x = rsqrt(u_xlat0.x);
                        u_xlat0.xyz = u_xlat0.xxx * input.INTERP2.xyz;
                        output.SV_TARGET0.xyz = half3(u_xlat0.xyz);
                        output.SV_TARGET0.w = half(0.0);
                        return output;
                    }
                    "
                }
                SubProgram "metal " {
                    Keywords { "_ALPHATEST_ON" }
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    #ifndef XLT_REMAP_O
                    	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
                    #endif
                    constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
                    struct FGlobals_Type
                    {
                        float2 _GlobalMipBias;
                    };
                    
                    struct UnityPerMaterial_Type
                    {
                        float4 _OutlineColor;
                        float _OutlineWidth;
                        float4 _DisolveMap_TexelSize;
                        float _DisolveColorWidth;
                        float _DisolveRate;
                        float4 _DisolveColor;
                    };
                    
                    struct Mtl_FragmentIn
                    {
                        float4 INTERP0 [[ user(INTERP0) ]] ;
                        float4 INTERP1 [[ user(INTERP1) ]] ;
                        float3 INTERP2 [[ user(INTERP2) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        half4 SV_TARGET0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    fragment Mtl_FragmentOut xlatMtlMain(
                        constant FGlobals_Type& FGlobals [[ buffer(0) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(1) ]],
                        sampler sampler_DisolveMap [[ sampler (0) ]],
                        texture2d<half, access::sample > _DisolveMap [[ texture(0) ]] ,
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        float3 u_xlat0;
                        bool u_xlatb0;
                        float u_xlat1;
                        u_xlat0.x = input.INTERP1.w * UnityPerMaterial._DisolveRate;
                        u_xlat1 = fma((-UnityPerMaterial._DisolveRate), input.INTERP1.w, 1.0);
                        u_xlat0.x = fma((-u_xlat0.x), UnityPerMaterial._DisolveColorWidth, u_xlat1);
                        u_xlat1 = float(_DisolveMap.sample(sampler_DisolveMap, input.INTERP0.xy, bias(FGlobals._GlobalMipBias.xyxx.x)).w);
                        u_xlatb0 = u_xlat1>=u_xlat0.x;
                        if(((int(u_xlatb0) * int(0xffffffffu)))==0){discard_fragment();}
                        u_xlat0.x = dot(input.INTERP2.xyz, input.INTERP2.xyz);
                        u_xlat0.x = rsqrt(u_xlat0.x);
                        u_xlat0.xyz = u_xlat0.xxx * input.INTERP2.xyz;
                        output.SV_TARGET0.xyz = half3(u_xlat0.xyz);
                        output.SV_TARGET0.w = half(0.0);
                        return output;
                    }
                    "
                }
            }
        }
    }
    SubShader {
        Tags { "QUEUE" = "AlphaTest" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderGraphShader" = "true" "ShaderGraphTargetId" = "UniversalUnlitSubTarget" "UniversalMaterialType" = "Unlit" }
        Pass {
            Name "Universal Forward"
            Tags { "QUEUE" = "AlphaTest" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderGraphShader" = "true" "ShaderGraphTargetId" = "UniversalUnlitSubTarget" "UniversalMaterialType" = "Unlit" }
            Blend Zero Zero, Zero Zero
            ZTest Off
            ZWrite Off
            Cull Off
            GpuProgramID 460517
        }
        Pass {
            Name "DepthOnly"
            Tags { "LIGHTMODE" = "DepthOnly" "QUEUE" = "AlphaTest" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderGraphShader" = "true" "ShaderGraphTargetId" = "UniversalUnlitSubTarget" "UniversalMaterialType" = "Unlit" }
            ColorMask 0 0
            Cull Off
            GpuProgramID 575115
        }
        Pass {
            Name "DepthNormalsOnly"
            Tags { "LIGHTMODE" = "DepthNormalsOnly" "QUEUE" = "AlphaTest" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderGraphShader" = "true" "ShaderGraphTargetId" = "UniversalUnlitSubTarget" "UniversalMaterialType" = "Unlit" }
            Cull Off
            GpuProgramID 620800
        }
        Pass {
            Name "ShadowCaster"
            Tags { "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "AlphaTest" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderGraphShader" = "true" "ShaderGraphTargetId" = "UniversalUnlitSubTarget" "UniversalMaterialType" = "Unlit" }
            ColorMask 0 0
            Cull Off
            GpuProgramID 703830
        }
        Pass {
            Name "DepthNormals"
            Tags { "LIGHTMODE" = "DepthNormalsOnly" "QUEUE" = "AlphaTest" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderGraphShader" = "true" "ShaderGraphTargetId" = "UniversalUnlitSubTarget" "UniversalMaterialType" = "Unlit" }
            Cull Off
            GpuProgramID 883583
        }
    }
Fallback "Hidden/Shader Graph/FallbackError"
CustomEditor "UnityEditor.ShaderGraph.GenericShaderGraphMaterialGUI"
}