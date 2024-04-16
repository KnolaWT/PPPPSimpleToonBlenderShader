//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Universal Render Pipeline/Simple Toon" {
    Properties {
        [Header(Base)] _BaseMap ("Base Map", 2D) = "white" { }
        _BaseColor ("Base Color", Color) = (1,1,1,1)
        _SubColor ("Sub Color", Color) = (1,1,1,1)
        _Cutoff ("Alpha Clipping", Range(0, 1)) = 0.5
        _DepthOffset ("Depth Offset", Float) = 0
        _RimMaskMap ("Mask Map", 2D) = "white" { }
        [Header(Rim Light)] _RimColor ("Rim Light Color", Color) = (0.5,0.5,0.5,1)
        _RimWidth ("Rim Light Width", Range(0, 1)) = 0.5
        _RimBoaderSmooth ("Rim Boader Smoothing", Range(0, 1)) = 0
        _RimVector ("Rim Vector", Vector) = (-0.5,1,0.2,0)
        _RimBaseColorCurve ("Rim BaseColor Curve", Float) = -1
        [Header(Outline)] _OutlineMap ("Outline Map", 2D) = "white" { }
        _OutlineColor ("Outline Color", Color) = (0,0,0,1)
        _OutlineWidth ("Outline Width", Float) = 1
        _OutlineDepthOffset ("Outline Depth Offset", Float) = 0
        _OutlineMinPixelSize ("Outline Min PixelSize", Float) = 2
        _OutlineScale ("Outline Scale", Float) = 1
        [Header(Effect)] [Toggle] _EnableEffect ("Enable Effect", Float) = 0
        _EffectMap ("Effect Map", 2D) = "black" { }
        _EffectColor ("Effect Color", Color) = (1,1,1,1)
        _EffectDistortionIntensity ("Distortion Intensity", Range(0, 1)) = 0.2
        _EffectSpeedU ("Distortion Speed", Float) = 0
        _EffectSpeedV ("Scroll Speed", Float) = 0
        [Header(Dissolve)] [Toggle] _EnableDissolve ("Enable Dissolve", Float) = 0
        _DissolveAlpha ("Dissolve Alpha", Range(0, 1)) = 1
        [Header(Enemy)] [Toggle] _EnableEnemy ("Enable Enemy", Float) = 0
        _BaseMapEnemy ("Base Map Enemy", 2D) = "white" { }
        _OutlineColorEnemy ("Outline Color Enemy", Color) = (0,0,0,1)
        _EffectColorEnemy ("Effect Color Enemy", Color) = (1,1,1,1)
        _Smoothness ("Smoothness", Range(0, 1)) = 0.5
        _SpecColor ("Specular Color", Color) = (0.5,0.5,0.5,0.5)
        _SpecGlossMap ("Specular Map", 2D) = "white" { }
        _SmoothnessSource ("Smoothness Source", Float) = 0
        _SpecularHighlights ("Specular Highlights", Float) = 1
        _BumpScale ("Scale", Float) = 1
        _BumpMap ("Normal Map", 2D) = "bump" { }
        _EmissionColor ("Emission Color", Color) = (0,0,0,1)
        _EmissionMap ("Emission Map", 2D) = "white" { }
        [Header(Blending state)] _Surface ("__surface", Float) = 0
        _Blend ("__blend", Float) = 0
        _Cull ("__cull", Float) = 2
        [ToggleUI] _AlphaClip ("__clip", Float) = 0
        _SrcBlend ("__src", Float) = 1
        _DstBlend ("__dst", Float) = 0
        _ZWrite ("__zw", Float) = 1
        [ToggleUI] _ReceiveShadows ("Receive Shadows", Float) = 1
        _QueueOffset ("Queue offset", Float) = 0
        _MainTex ("BaseMap", 2D) = "white" { }
        _Color ("Base Color", Color) = (1,1,1,1)
        _Shininess ("Smoothness", Float) = 0
        _GlossinessSource ("GlossinessSource", Float) = 0
        _SpecSource ("SpecularHighlights", Float) = 0
        unity_Lightmaps ("unity_Lightmaps", 2DArray) = "" { }
        unity_LightmapsInd ("unity_LightmapsInd", 2DArray) = "" { }
        unity_ShadowMasks ("unity_ShadowMasks", 2DArray) = "" { }
        [Toggle(_ENABLE_DITHER_BASECOLOR_ALPHA)] _EnableDitherBaseColorAlpha ("Enable Dither BaseColor Alpha", Float) = 0
    }
    SubShader {
        LOD 300
        Tags { "IGNOREPROJECTOR" = "true" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "4.5" "UniversalMaterialType" = "SimpleLit" }
        Pass {
            Name "ForwardLit"
            LOD 300
            Tags { "IGNOREPROJECTOR" = "true" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "4.5" "UniversalMaterialType" = "SimpleLit" }
            Blend Zero Zero, Zero Zero
            ZWrite Off
            Cull Off
            GpuProgramID 21309
            PlayerProgram "vp" {
                SubProgram "metal " {
                    Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS_CASCADE" }
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
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_VertexIn
                    {
                        float4 POSITION0 [[ attribute(0) ]] ;
                        float3 NORMAL0 [[ attribute(1) ]] ;
                        float4 TANGENT0 [[ attribute(2) ]] ;
                        float2 TEXCOORD0 [[ attribute(3) ]] ;
                        float2 TEXCOORD1 [[ attribute(4) ]] ;
                        float3 TEXCOORD3 [[ attribute(5) ]] ;
                        float4 COLOR0 [[ attribute(6) ]] ;
                    };
                    
                    struct Mtl_VertexOut
                    {
                        float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
                        float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
                        half TEXCOORD5 [[ user(TEXCOORD5) ]];
                        half3 TEXCOORD2 [[ user(TEXCOORD2) ]];
                        half3 TEXCOORD10 [[ user(TEXCOORD10) ]];
                        half3 TEXCOORD7 [[ user(TEXCOORD7) ]];
                        float4 mtl_Position [[ position, invariant ]];
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
                        half4 u_xlat16_1;
                        float4 u_xlat2;
                        bool3 u_xlatb2;
                        float3 u_xlat3;
                        float3 u_xlat4;
                        half3 u_xlat16_5;
                        half3 u_xlat16_6;
                        float u_xlat21;
                        bool u_xlatb21;
                        output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, UnityPerMaterial._BaseMap_ST.xy, UnityPerMaterial._BaseMap_ST.zw);
                        output.TEXCOORD0.zw = fma(input.TEXCOORD1.xy, UnityPerMaterial._BaseMap_ST.xy, UnityPerMaterial._BaseMap_ST.zw);
                        u_xlat0.xyz = input.POSITION0.yyy * UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
                        u_xlat0.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat0.xyz);
                        u_xlat0.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat0.xyz);
                        u_xlat0.xyz = u_xlat0.xyz + UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
                        output.TEXCOORD1.xyz = u_xlat0.xyz;
                        u_xlat1.x = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
                        u_xlat1.y = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
                        u_xlat1.z = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
                        u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
                        u_xlat21 = max(u_xlat21, 1.17549435e-38);
                        u_xlat21 = rsqrt(u_xlat21);
                        u_xlat1.xyz = float3(u_xlat21) * u_xlat1.xyz;
                        u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
                        u_xlat21 = rsqrt(u_xlat21);
                        u_xlat2.xyz = float3(u_xlat21) * u_xlat1.xyz;
                        output.TEXCOORD2.xyz = half3(u_xlat2.xyz);
                        u_xlat3.xyz = input.TANGENT0.yyy * UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
                        u_xlat3.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.TANGENT0.xxx, u_xlat3.xyz);
                        u_xlat3.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.TANGENT0.zzz, u_xlat3.xyz);
                        u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
                        u_xlat21 = max(u_xlat21, 1.17549435e-38);
                        u_xlat21 = rsqrt(u_xlat21);
                        u_xlat3.xyz = float3(u_xlat21) * u_xlat3.xyz;
                        u_xlat4.xyz = u_xlat1.zxy * u_xlat3.yzx;
                        u_xlat4.xyz = fma(u_xlat1.yzx, u_xlat3.zxy, (-u_xlat4.xyz));
                        u_xlatb21 = UnityPerDraw.unity_WorldTransformParams.w>=half(0.0);
                        u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
                        u_xlat16_5.x = half(u_xlat21 * input.TANGENT0.w);
                        u_xlat16_5.xyz = half3(u_xlat4.xyz * float3(u_xlat16_5.xxx));
                        u_xlat4.xyz = float3(u_xlat16_5.xyz) * input.TEXCOORD3.yyy;
                        u_xlat3.xyz = fma(input.TEXCOORD3.xxx, u_xlat3.xyz, u_xlat4.xyz);
                        u_xlat1.xyz = fma(input.TEXCOORD3.zzz, u_xlat1.xyz, u_xlat3.xyz);
                        u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
                        u_xlat21 = rsqrt(u_xlat21);
                        u_xlat1.xyz = float3(u_xlat21) * u_xlat1.xyz;
                        output.TEXCOORD10.xyz = half3(u_xlat1.xyz);
                        output.TEXCOORD5 = half(0.0);
                        u_xlat16_5.x = half(u_xlat2.y * u_xlat2.y);
                        u_xlat16_5.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_5.x))));
                        u_xlat16_1 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
                        u_xlat16_6.x = dot(UnityPerDraw.unity_SHBr, u_xlat16_1);
                        u_xlat16_6.y = dot(UnityPerDraw.unity_SHBg, u_xlat16_1);
                        u_xlat16_6.z = dot(UnityPerDraw.unity_SHBb, u_xlat16_1);
                        u_xlat16_5.xyz = fma(UnityPerDraw.unity_SHC.xyz, u_xlat16_5.xxx, u_xlat16_6.xyz);
                        u_xlat2.w = 1.0;
                        u_xlat16_6.x = half(dot(float4(UnityPerDraw.unity_SHAr), u_xlat2));
                        u_xlat16_6.y = half(dot(float4(UnityPerDraw.unity_SHAg), u_xlat2));
                        u_xlat16_6.z = half(dot(float4(UnityPerDraw.unity_SHAb), u_xlat2));
                        u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
                        u_xlat16_6.xyz = u_xlat16_5.xyz * half3(12.9200001, 12.9200001, 12.9200001);
                        u_xlatb2.xyz = (half3(0.00313080009, 0.00313080009, 0.00313080009)>=u_xlat16_5.xyz);
                        u_xlat16_5.xyz = log2(abs(u_xlat16_5.xyz));
                        u_xlat16_5.xyz = u_xlat16_5.xyz * half3(0.416666657, 0.416666657, 0.416666657);
                        u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
                        u_xlat16_5.xyz = fma(u_xlat16_5.xyz, half3(1.05499995, 1.05499995, 1.05499995), half3(-0.0549999997, -0.0549999997, -0.0549999997));
                        {
                            half3 hlslcc_movcTemp = u_xlat16_5;
                            hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat16_6.x : u_xlat16_5.x;
                            hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat16_6.y : u_xlat16_5.y;
                            hlslcc_movcTemp.z = (u_xlatb2.z) ? u_xlat16_6.z : u_xlat16_5.z;
                            u_xlat16_5 = hlslcc_movcTemp;
                        }
                        output.TEXCOORD7.xyz = max(u_xlat16_5.xyz, half3(0.0, 0.0, 0.0));
                        u_xlat2.xyz = (-u_xlat0.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
                        u_xlatb21 = VGlobals.unity_OrthoParams.w==0.0;
                        u_xlat3.x = (u_xlatb21) ? u_xlat2.x : VGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
                        u_xlat3.y = (u_xlatb21) ? u_xlat2.y : VGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
                        u_xlat3.z = (u_xlatb21) ? u_xlat2.z : VGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
                        u_xlat16_5.x = dot(u_xlat3.xyz, u_xlat3.xyz);
                        u_xlat16_5.x = rsqrt(u_xlat16_5.x);
                        u_xlat16_5.xyz = half3(u_xlat3.xyz * float3(u_xlat16_5.xxx));
                        u_xlat16_5.xyz = u_xlat16_5.xyz * half3(UnityPerMaterial._DepthOffset);
                        u_xlat21 = (-input.COLOR0.w) + 1.0;
                        u_xlat2.xyz = float3(u_xlat21) * float3(u_xlat16_5.xyz);
                        u_xlat2.xyz = u_xlat2.xyz * float3(0.0599999987, 0.0599999987, 0.0599999987);
                        u_xlat16_5.x = (-UnityPerMaterial._EnableEnemy) + half(1.0);
                        u_xlat0.xyz = fma(u_xlat2.xyz, float3(u_xlat16_5.xxx), u_xlat0.xyz);
                        u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
                        u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
                        u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
                        output.mtl_Position = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_MatrixVP[3];
                        return output;
                    }
                    "
                }
                SubProgram "metal " {
                    Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS" }
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
                    
                    struct MainLightShadows_Type
                    {
                        float4 hlslcc_mtx4x4_MainLightWorldToShadow[20];
                        float4 _CascadeShadowSplitSpheres0;
                        float4 _CascadeShadowSplitSpheres1;
                        float4 _CascadeShadowSplitSpheres2;
                        float4 _CascadeShadowSplitSpheres3;
                        float4 _CascadeShadowSplitSphereRadii;
                        half4 _MainLightShadowOffset0;
                        half4 _MainLightShadowOffset1;
                        half4 _MainLightShadowOffset2;
                        half4 _MainLightShadowOffset3;
                        half4 _MainLightShadowParams;
                        float4 _MainLightShadowmapSize;
                    };
                    
                    struct UnityPerMaterial_Type
                    {
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_VertexIn
                    {
                        float4 POSITION0 [[ attribute(0) ]] ;
                        float3 NORMAL0 [[ attribute(1) ]] ;
                        float4 TANGENT0 [[ attribute(2) ]] ;
                        float2 TEXCOORD0 [[ attribute(3) ]] ;
                        float2 TEXCOORD1 [[ attribute(4) ]] ;
                        float3 TEXCOORD3 [[ attribute(5) ]] ;
                        float4 COLOR0 [[ attribute(6) ]] ;
                    };
                    
                    struct Mtl_VertexOut
                    {
                        float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
                        float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
                        half TEXCOORD5 [[ user(TEXCOORD5) ]];
                        half3 TEXCOORD2 [[ user(TEXCOORD2) ]];
                        half3 TEXCOORD10 [[ user(TEXCOORD10) ]];
                        float4 TEXCOORD6 [[ user(TEXCOORD6) ]];
                        half3 TEXCOORD7 [[ user(TEXCOORD7) ]];
                        float4 mtl_Position [[ position, invariant ]];
                    };
                    
                    vertex Mtl_VertexOut xlatMtlMain(
                        constant VGlobals_Type& VGlobals [[ buffer(0) ]],
                        constant UnityPerDraw_Type& UnityPerDraw [[ buffer(1) ]],
                        constant MainLightShadows_Type& MainLightShadows [[ buffer(2) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(3) ]],
                        Mtl_VertexIn input [[ stage_in ]])
                    {
                        Mtl_VertexOut output;
                        float4 u_xlat0;
                        float4 u_xlat1;
                        half4 u_xlat16_1;
                        float4 u_xlat2;
                        bool3 u_xlatb2;
                        float3 u_xlat3;
                        float3 u_xlat4;
                        half3 u_xlat16_5;
                        half3 u_xlat16_6;
                        float u_xlat21;
                        bool u_xlatb21;
                        output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, UnityPerMaterial._BaseMap_ST.xy, UnityPerMaterial._BaseMap_ST.zw);
                        output.TEXCOORD0.zw = fma(input.TEXCOORD1.xy, UnityPerMaterial._BaseMap_ST.xy, UnityPerMaterial._BaseMap_ST.zw);
                        u_xlat0.xyz = input.POSITION0.yyy * UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
                        u_xlat0.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat0.xyz);
                        u_xlat0.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat0.xyz);
                        u_xlat0.xyz = u_xlat0.xyz + UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
                        output.TEXCOORD1.xyz = u_xlat0.xyz;
                        u_xlat1.x = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
                        u_xlat1.y = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
                        u_xlat1.z = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
                        u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
                        u_xlat21 = max(u_xlat21, 1.17549435e-38);
                        u_xlat21 = rsqrt(u_xlat21);
                        u_xlat1.xyz = float3(u_xlat21) * u_xlat1.xyz;
                        u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
                        u_xlat21 = rsqrt(u_xlat21);
                        u_xlat2.xyz = float3(u_xlat21) * u_xlat1.xyz;
                        output.TEXCOORD2.xyz = half3(u_xlat2.xyz);
                        u_xlat3.xyz = input.TANGENT0.yyy * UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
                        u_xlat3.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.TANGENT0.xxx, u_xlat3.xyz);
                        u_xlat3.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.TANGENT0.zzz, u_xlat3.xyz);
                        u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
                        u_xlat21 = max(u_xlat21, 1.17549435e-38);
                        u_xlat21 = rsqrt(u_xlat21);
                        u_xlat3.xyz = float3(u_xlat21) * u_xlat3.xyz;
                        u_xlat4.xyz = u_xlat1.zxy * u_xlat3.yzx;
                        u_xlat4.xyz = fma(u_xlat1.yzx, u_xlat3.zxy, (-u_xlat4.xyz));
                        u_xlatb21 = UnityPerDraw.unity_WorldTransformParams.w>=half(0.0);
                        u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
                        u_xlat16_5.x = half(u_xlat21 * input.TANGENT0.w);
                        u_xlat16_5.xyz = half3(u_xlat4.xyz * float3(u_xlat16_5.xxx));
                        u_xlat4.xyz = float3(u_xlat16_5.xyz) * input.TEXCOORD3.yyy;
                        u_xlat3.xyz = fma(input.TEXCOORD3.xxx, u_xlat3.xyz, u_xlat4.xyz);
                        u_xlat1.xyz = fma(input.TEXCOORD3.zzz, u_xlat1.xyz, u_xlat3.xyz);
                        u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
                        u_xlat21 = rsqrt(u_xlat21);
                        u_xlat1.xyz = float3(u_xlat21) * u_xlat1.xyz;
                        output.TEXCOORD10.xyz = half3(u_xlat1.xyz);
                        output.TEXCOORD5 = half(0.0);
                        u_xlat1.xyz = (-u_xlat0.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
                        u_xlatb21 = VGlobals.unity_OrthoParams.w==0.0;
                        u_xlat3.x = (u_xlatb21) ? u_xlat1.x : VGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
                        u_xlat3.y = (u_xlatb21) ? u_xlat1.y : VGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
                        u_xlat3.z = (u_xlatb21) ? u_xlat1.z : VGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
                        u_xlat16_5.x = dot(u_xlat3.xyz, u_xlat3.xyz);
                        u_xlat16_5.x = rsqrt(u_xlat16_5.x);
                        u_xlat16_5.xyz = half3(u_xlat3.xyz * float3(u_xlat16_5.xxx));
                        u_xlat16_5.xyz = u_xlat16_5.xyz * half3(UnityPerMaterial._DepthOffset);
                        u_xlat21 = (-input.COLOR0.w) + 1.0;
                        u_xlat1.xyz = float3(u_xlat21) * float3(u_xlat16_5.xyz);
                        u_xlat1.xyz = u_xlat1.xyz * float3(0.0599999987, 0.0599999987, 0.0599999987);
                        u_xlat16_5.x = (-UnityPerMaterial._EnableEnemy) + half(1.0);
                        u_xlat0.xyz = fma(u_xlat1.xyz, float3(u_xlat16_5.xxx), u_xlat0.xyz);
                        u_xlat1.xyz = u_xlat0.yyy * MainLightShadows.hlslcc_mtx4x4_MainLightWorldToShadow[1].xyz;
                        u_xlat1.xyz = fma(MainLightShadows.hlslcc_mtx4x4_MainLightWorldToShadow[0].xyz, u_xlat0.xxx, u_xlat1.xyz);
                        u_xlat1.xyz = fma(MainLightShadows.hlslcc_mtx4x4_MainLightWorldToShadow[2].xyz, u_xlat0.zzz, u_xlat1.xyz);
                        output.TEXCOORD6.xyz = u_xlat1.xyz + MainLightShadows.hlslcc_mtx4x4_MainLightWorldToShadow[3].xyz;
                        output.TEXCOORD6.w = 0.0;
                        u_xlat16_5.x = half(u_xlat2.y * u_xlat2.y);
                        u_xlat16_5.x = half(fma(u_xlat2.x, u_xlat2.x, (-float(u_xlat16_5.x))));
                        u_xlat16_1 = half4(u_xlat2.yzzx * u_xlat2.xyzz);
                        u_xlat16_6.x = dot(UnityPerDraw.unity_SHBr, u_xlat16_1);
                        u_xlat16_6.y = dot(UnityPerDraw.unity_SHBg, u_xlat16_1);
                        u_xlat16_6.z = dot(UnityPerDraw.unity_SHBb, u_xlat16_1);
                        u_xlat16_5.xyz = fma(UnityPerDraw.unity_SHC.xyz, u_xlat16_5.xxx, u_xlat16_6.xyz);
                        u_xlat2.w = 1.0;
                        u_xlat16_6.x = half(dot(float4(UnityPerDraw.unity_SHAr), u_xlat2));
                        u_xlat16_6.y = half(dot(float4(UnityPerDraw.unity_SHAg), u_xlat2));
                        u_xlat16_6.z = half(dot(float4(UnityPerDraw.unity_SHAb), u_xlat2));
                        u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
                        u_xlat16_6.xyz = u_xlat16_5.xyz * half3(12.9200001, 12.9200001, 12.9200001);
                        u_xlatb2.xyz = (half3(0.00313080009, 0.00313080009, 0.00313080009)>=u_xlat16_5.xyz);
                        u_xlat16_5.xyz = log2(abs(u_xlat16_5.xyz));
                        u_xlat16_5.xyz = u_xlat16_5.xyz * half3(0.416666657, 0.416666657, 0.416666657);
                        u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
                        u_xlat16_5.xyz = fma(u_xlat16_5.xyz, half3(1.05499995, 1.05499995, 1.05499995), half3(-0.0549999997, -0.0549999997, -0.0549999997));
                        {
                            half3 hlslcc_movcTemp = u_xlat16_5;
                            hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat16_6.x : u_xlat16_5.x;
                            hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat16_6.y : u_xlat16_5.y;
                            hlslcc_movcTemp.z = (u_xlatb2.z) ? u_xlat16_6.z : u_xlat16_5.z;
                            u_xlat16_5 = hlslcc_movcTemp;
                        }
                        output.TEXCOORD7.xyz = max(u_xlat16_5.xyz, half3(0.0, 0.0, 0.0));
                        u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
                        u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
                        u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
                        output.mtl_Position = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_MatrixVP[3];
                        return output;
                    }
                    "
                }
            }
            PlayerProgram "fp" {
                SubProgram "metal " {
                    Keywords { "_ADDITIONAL_LIGHTS" "_ENABLE_DITHER_BASECOLOR_ALPHA" "_LIGHT_COOKIES" "_MAIN_LIGHT_SHADOWS_CASCADE" "_SHADOWS_SOFT" }
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    constant float4 ImmCB_0[64] =
                    {
                    	float4(0.5, 0.0, 0.0, 0.0),
                    	float4(48.5, 0.0, 0.0, 0.0),
                    	float4(12.5, 0.0, 0.0, 0.0),
                    	float4(60.5, 0.0, 0.0, 0.0),
                    	float4(3.5, 0.0, 0.0, 0.0),
                    	float4(51.5, 0.0, 0.0, 0.0),
                    	float4(15.5, 0.0, 0.0, 0.0),
                    	float4(63.5, 0.0, 0.0, 0.0),
                    	float4(32.5, 0.0, 0.0, 0.0),
                    	float4(16.5, 0.0, 0.0, 0.0),
                    	float4(44.5, 0.0, 0.0, 0.0),
                    	float4(28.5, 0.0, 0.0, 0.0),
                    	float4(35.5, 0.0, 0.0, 0.0),
                    	float4(19.5, 0.0, 0.0, 0.0),
                    	float4(47.5, 0.0, 0.0, 0.0),
                    	float4(31.5, 0.0, 0.0, 0.0),
                    	float4(8.5, 0.0, 0.0, 0.0),
                    	float4(56.5, 0.0, 0.0, 0.0),
                    	float4(4.5, 0.0, 0.0, 0.0),
                    	float4(52.5, 0.0, 0.0, 0.0),
                    	float4(11.5, 0.0, 0.0, 0.0),
                    	float4(59.5, 0.0, 0.0, 0.0),
                    	float4(7.5, 0.0, 0.0, 0.0),
                    	float4(55.5, 0.0, 0.0, 0.0),
                    	float4(40.5, 0.0, 0.0, 0.0),
                    	float4(24.5, 0.0, 0.0, 0.0),
                    	float4(36.5, 0.0, 0.0, 0.0),
                    	float4(20.5, 0.0, 0.0, 0.0),
                    	float4(43.5, 0.0, 0.0, 0.0),
                    	float4(27.5, 0.0, 0.0, 0.0),
                    	float4(39.5, 0.0, 0.0, 0.0),
                    	float4(23.5, 0.0, 0.0, 0.0),
                    	float4(2.5, 0.0, 0.0, 0.0),
                    	float4(50.5, 0.0, 0.0, 0.0),
                    	float4(14.5, 0.0, 0.0, 0.0),
                    	float4(62.5, 0.0, 0.0, 0.0),
                    	float4(1.5, 0.0, 0.0, 0.0),
                    	float4(49.5, 0.0, 0.0, 0.0),
                    	float4(13.5, 0.0, 0.0, 0.0),
                    	float4(61.5, 0.0, 0.0, 0.0),
                    	float4(34.5, 0.0, 0.0, 0.0),
                    	float4(18.5, 0.0, 0.0, 0.0),
                    	float4(46.5, 0.0, 0.0, 0.0),
                    	float4(30.5, 0.0, 0.0, 0.0),
                    	float4(33.5, 0.0, 0.0, 0.0),
                    	float4(17.5, 0.0, 0.0, 0.0),
                    	float4(45.5, 0.0, 0.0, 0.0),
                    	float4(29.5, 0.0, 0.0, 0.0),
                    	float4(10.5, 0.0, 0.0, 0.0),
                    	float4(58.5, 0.0, 0.0, 0.0),
                    	float4(6.5, 0.0, 0.0, 0.0),
                    	float4(54.5, 0.0, 0.0, 0.0),
                    	float4(9.5, 0.0, 0.0, 0.0),
                    	float4(57.5, 0.0, 0.0, 0.0),
                    	float4(5.5, 0.0, 0.0, 0.0),
                    	float4(53.5, 0.0, 0.0, 0.0),
                    	float4(42.5, 0.0, 0.0, 0.0),
                    	float4(26.5, 0.0, 0.0, 0.0),
                    	float4(38.5, 0.0, 0.0, 0.0),
                    	float4(22.5, 0.0, 0.0, 0.0),
                    	float4(41.5, 0.0, 0.0, 0.0),
                    	float4(25.5, 0.0, 0.0, 0.0),
                    	float4(37.5, 0.0, 0.0, 0.0),
                    	float4(21.5, 0.0, 0.0, 0.0)
                    };
                    #ifndef XLT_REMAP_O
                    	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
                    #endif
                    constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
                    struct FGlobals_Type
                    {
                        float4 _Time;
                        float3 _WorldSpaceCameraPos;
                        float4 _ScreenParams;
                        float2 _GlobalMipBias;
                        float4 unity_OrthoParams;
                        float4 hlslcc_mtx4x4unity_MatrixV[4];
                    };
                    
                    struct UnityPerMaterial_Type
                    {
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_FragmentIn
                    {
                        float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
                        float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
                        half3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    		template <typename UVecType> UVecType bitFieldInsert(const UVecType width, const UVecType offset, const UVecType src2, const UVecType src3)
                    		{
                    			UVecType bitmask = (((UVecType(1) << width)-1) << offset) & 0xffffffff;
                    			return ((src2 << offset) & bitmask) | (src3 & ~bitmask);
                    		}; 
                    fragment Mtl_FragmentOut xlatMtlMain(
                        constant FGlobals_Type& FGlobals [[ buffer(0) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(1) ]],
                        sampler sampler_BaseMap [[ sampler (0) ]],
                        sampler sampler_RimMaskMap [[ sampler (1) ]],
                        sampler sampler_BaseMapEnemy [[ sampler (2) ]],
                        sampler sampler_EffectMap [[ sampler (3) ]],
                        texture2d<half, access::sample > _BaseMap [[ texture(0) ]] ,
                        texture2d<half, access::sample > _RimMaskMap [[ texture(1) ]] ,
                        texture2d<half, access::sample > _BaseMapEnemy [[ texture(2) ]] ,
                        texture2d<half, access::sample > _EffectMap [[ texture(3) ]] ,
                        float4 mtl_FragCoord [[ position ]],
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        float4 hlslcc_FragCoord = float4(mtl_FragCoord.xyz, 1.0/mtl_FragCoord.w);
                        float4 u_xlat0;
                        half2 u_xlat16_0;
                        bool3 u_xlatb0;
                        float4 u_xlat1;
                        half4 u_xlat16_1;
                        int u_xlati1;
                        uint2 u_xlatu1;
                        bool u_xlatb1;
                        half4 u_xlat16_2;
                        half3 u_xlat16_3;
                        half2 u_xlat16_4;
                        half2 u_xlat16_5;
                        float u_xlat6;
                        half3 u_xlat16_6;
                        int u_xlati7;
                        bool u_xlatb7;
                        half u_xlat16_8;
                        half3 u_xlat16_9;
                        half2 u_xlat16_16;
                        half u_xlat16_20;
                        half u_xlat16_21;
                        u_xlatb0.xyz = (half3(UnityPerMaterial._EnableEnemy, UnityPerMaterial._EnableEffect, UnityPerMaterial._Surface)==half3(1.0, 1.0, 1.0));
                        if(u_xlatb0.x){
                            u_xlat16_1 = _BaseMapEnemy.sample(sampler_BaseMapEnemy, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColorEnemy.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        } else {
                            u_xlat16_1 = _BaseMap.sample(sampler_BaseMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColor.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        }
                        if(u_xlatb0.y){
                            u_xlat1.yz = fma(FGlobals._Time.yy, float2(half2(UnityPerMaterial._EffectSpeedU, UnityPerMaterial._EffectSpeedV)), input.TEXCOORD0.zw);
                            u_xlat1.w = input.TEXCOORD0.w;
                            u_xlat16_0.xy = _EffectMap.sample(sampler_EffectMap, u_xlat1.yw, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                            u_xlat16_21 = u_xlat16_0.y + half(-0.5);
                            u_xlat16_21 = dot(half2(u_xlat16_21), half2(UnityPerMaterial._EffectDistortionIntensity));
                            u_xlat1.x = float(u_xlat16_21) + input.TEXCOORD0.z;
                            u_xlat16_6.xz = _EffectMap.sample(sampler_EffectMap, u_xlat1.xz, bias(FGlobals._GlobalMipBias.xyxx.x)).yw;
                            u_xlat16_4.xy = u_xlat16_0.xx + u_xlat16_6.zx;
                            u_xlat16_4.xy = u_xlat16_4.xy + half2(-0.850000024, -0.699999988);
                            u_xlat16_4.xy = u_xlat16_4.xy * half2(20.0000191, 3.33333325);
                            u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0h, 1.0h);
                            u_xlat16_16.xy = fma(u_xlat16_4.xy, half2(-2.0, -2.0), half2(3.0, 3.0));
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_4.xy;
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_16.xy;
                            u_xlat16_21 = u_xlat16_4.y * u_xlat16_4.x;
                            u_xlat16_3.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
                            u_xlat16_2.xyz = fma(half3(u_xlat16_21), u_xlat16_3.xyz, u_xlat16_2.xyz);
                        }
                        u_xlat16_20 = u_xlat16_2.w * UnityPerMaterial._BaseColor.w;
                        u_xlatb0.x = FGlobals.unity_OrthoParams.w==0.0;
                        u_xlat1.xyz = (-input.TEXCOORD1.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
                        u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
                        u_xlat6 = rsqrt(u_xlat6);
                        u_xlat1.xyz = float3(u_xlat6) * u_xlat1.xyz;
                        u_xlat16_3.x = (u_xlatb0.x) ? half(u_xlat1.x) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z);
                        u_xlat16_3.y = (u_xlatb0.x) ? half(u_xlat1.y) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z);
                        u_xlat16_3.z = (u_xlatb0.x) ? half(u_xlat1.z) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z);
                        u_xlat0.x = dot(input.TEXCOORD2.xyz, input.TEXCOORD2.xyz);
                        u_xlat0.x = rsqrt(u_xlat0.x);
                        u_xlat0.xyw = u_xlat0.xxx * float3(input.TEXCOORD2.xyz);
                        u_xlat1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
                        u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
                        u_xlat1.x = rsqrt(u_xlat1.x);
                        u_xlat1.xyz = u_xlat1.xxx * float3(u_xlat16_3.xyz);
                        u_xlat16_5.xy = _RimMaskMap.sample(sampler_RimMaskMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                        u_xlat1.x = dot(u_xlat0.xyw, u_xlat1.xyz);
                        u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
                        u_xlat16_3.x = half((-u_xlat1.x) + 1.0);
                        u_xlat16_9.x = dot(UnityPerMaterial._RimVector.xyz, UnityPerMaterial._RimVector.xyz);
                        u_xlat16_9.x = rsqrt(u_xlat16_9.x);
                        u_xlat16_9.xyz = u_xlat16_9.xxx * UnityPerMaterial._RimVector.xyz;
                        u_xlat0.x = dot(u_xlat0.xyw, float3(u_xlat16_9.xyz));
                        u_xlat0.x = fma(u_xlat0.x, 0.5, 0.5);
                        u_xlat16_9.x = fma((-UnityPerMaterial._RimBoaderSmooth), half(0.5), half(0.5));
                        u_xlat16_3.z = fma(UnityPerMaterial._RimBoaderSmooth, half(0.5), half(0.5));
                        u_xlat16_21 = UnityPerMaterial._RimWidth + half(-0.5);
                        u_xlat16_3.x = half(fma(float(u_xlat16_3.x), u_xlat0.x, float(u_xlat16_21)));
                        u_xlat16_3.xz = (-u_xlat16_9.xx) + u_xlat16_3.xz;
                        u_xlat16_9.x = half(1.0) / u_xlat16_3.z;
                        u_xlat16_3.x = u_xlat16_9.x * u_xlat16_3.x;
                        u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0h, 1.0h);
                        u_xlat16_9.x = fma(u_xlat16_3.x, half(-2.0), half(3.0));
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
                        u_xlat16_9.x = (-u_xlat16_5.y) + half(1.0);
                        u_xlat16_3.x = max(u_xlat16_9.x, u_xlat16_3.x);
                        u_xlat16_9.xyz = UnityPerMaterial._BaseColor.xyz * UnityPerMaterial._RimColor.xyz;
                        u_xlat0.x = dot(UnityPerMaterial._BaseColor.xyz, half3(0.298999995, 0.587000012, 0.114));
                        u_xlat6 = fma((-u_xlat0.x), u_xlat0.x, u_xlat0.x);
                        u_xlat0.x = fma((-u_xlat6), (-float(UnityPerMaterial._RimBaseColorCurve)), u_xlat0.x);
                        u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
                        u_xlat0.x = u_xlat0.x * float(u_xlat16_3.x);
                        u_xlat1.xyz = float3(u_xlat16_5.xxx) * float3(u_xlat16_9.xyz);
                        u_xlat16_3.x = (-UnityPerMaterial._EnableEnemy) + half(1.0);
                        u_xlat1.xyz = u_xlat1.xyz * float3(u_xlat16_3.xxx);
                        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
                        u_xlat1.xyz = fma(float3(u_xlat16_2.xyz), float3(UnityPerMaterial._BaseColor.xyz), u_xlat1.xyz);
                        u_xlat16_2.xyz = (-UnityPerMaterial._SubColor.xyz) + half3(1.0, 1.0, 1.0);
                        u_xlat16_2.xyz = half3(fma(u_xlat0.xxx, float3(u_xlat16_2.xyz), float3(UnityPerMaterial._SubColor.xyz)));
                        u_xlat0.xyw = u_xlat1.xyz * float3(u_xlat16_2.xyz);
                        u_xlat1.xy = FGlobals._ScreenParams.zw + float2(-1.0, -1.0);
                        u_xlat1.xy = u_xlat1.xy * hlslcc_FragCoord.xy;
                        u_xlat1.xy = u_xlat1.xy * FGlobals._ScreenParams.xy;
                        u_xlatu1.xy = uint2(u_xlat1.xy);
                        u_xlati1 = int(bitFieldInsert(0x3u, 0x3u, u_xlatu1.x, 0x0u));
                        u_xlati1 = int(bitFieldInsert(0x3u, 0x0u, u_xlatu1.y, uint(u_xlati1)));
                        u_xlat1.x = fma((-ImmCB_0[u_xlati1].x), 0.015625, float(u_xlat16_20));
                        u_xlatb1 = u_xlat1.x<0.0;
                        if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard_fragment();}
                        u_xlatb1 = UnityPerMaterial._EnableDissolve==half(1.0);
                        u_xlati7 = int((UnityPerMaterial._DissolveAlpha>=u_xlat16_20) ? 0xFFFFFFFFu : uint(0));
                        u_xlat16_2.x = (u_xlati7 != 0) ? half(1.0) : half(0.0);
                        u_xlatb7 = u_xlati7==0x0;
                        u_xlatb7 = u_xlatb1 && u_xlatb7;
                        if(((int(u_xlatb7) * int(0xffffffffu)))!=0){discard_fragment();}
                        u_xlat16_8 = (u_xlatb0.z) ? u_xlat16_20 : half(1.0);
                        output.SV_Target0.w = (u_xlatb1) ? u_xlat16_2.x : u_xlat16_8;
                        output.SV_Target0.xyz = half3(u_xlat0.xyw);
                        return output;
                    }
                    "
                }
                SubProgram "metal " {
                    Keywords { "_ADDITIONAL_LIGHTS" "_LIGHT_COOKIES" "_MAIN_LIGHT_SHADOWS_CASCADE" "_SHADOWS_SOFT" }
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    #ifndef XLT_REMAP_O
                    	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
                    #endif
                    constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
                    struct FGlobals_Type
                    {
                        float4 _Time;
                        float3 _WorldSpaceCameraPos;
                        float2 _GlobalMipBias;
                        float4 unity_OrthoParams;
                        float4 hlslcc_mtx4x4unity_MatrixV[4];
                    };
                    
                    struct UnityPerMaterial_Type
                    {
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_FragmentIn
                    {
                        float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
                        float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
                        half3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    fragment Mtl_FragmentOut xlatMtlMain(
                        constant FGlobals_Type& FGlobals [[ buffer(0) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(1) ]],
                        sampler sampler_BaseMap [[ sampler (0) ]],
                        sampler sampler_RimMaskMap [[ sampler (1) ]],
                        sampler sampler_BaseMapEnemy [[ sampler (2) ]],
                        sampler sampler_EffectMap [[ sampler (3) ]],
                        texture2d<half, access::sample > _BaseMap [[ texture(0) ]] ,
                        texture2d<half, access::sample > _RimMaskMap [[ texture(1) ]] ,
                        texture2d<half, access::sample > _BaseMapEnemy [[ texture(2) ]] ,
                        texture2d<half, access::sample > _EffectMap [[ texture(3) ]] ,
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        float4 u_xlat0;
                        half2 u_xlat16_0;
                        bool3 u_xlatb0;
                        float4 u_xlat1;
                        half4 u_xlat16_1;
                        bool u_xlatb1;
                        half4 u_xlat16_2;
                        half3 u_xlat16_3;
                        half2 u_xlat16_4;
                        half2 u_xlat16_5;
                        float u_xlat6;
                        half3 u_xlat16_6;
                        int u_xlati7;
                        bool u_xlatb7;
                        half u_xlat16_8;
                        half3 u_xlat16_9;
                        half2 u_xlat16_16;
                        half u_xlat16_20;
                        half u_xlat16_21;
                        u_xlatb0.xyz = (half3(UnityPerMaterial._EnableEnemy, UnityPerMaterial._EnableEffect, UnityPerMaterial._Surface)==half3(1.0, 1.0, 1.0));
                        if(u_xlatb0.x){
                            u_xlat16_1 = _BaseMapEnemy.sample(sampler_BaseMapEnemy, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColorEnemy.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        } else {
                            u_xlat16_1 = _BaseMap.sample(sampler_BaseMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColor.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        }
                        if(u_xlatb0.y){
                            u_xlat1.yz = fma(FGlobals._Time.yy, float2(half2(UnityPerMaterial._EffectSpeedU, UnityPerMaterial._EffectSpeedV)), input.TEXCOORD0.zw);
                            u_xlat1.w = input.TEXCOORD0.w;
                            u_xlat16_0.xy = _EffectMap.sample(sampler_EffectMap, u_xlat1.yw, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                            u_xlat16_21 = u_xlat16_0.y + half(-0.5);
                            u_xlat16_21 = dot(half2(u_xlat16_21), half2(UnityPerMaterial._EffectDistortionIntensity));
                            u_xlat1.x = float(u_xlat16_21) + input.TEXCOORD0.z;
                            u_xlat16_6.xz = _EffectMap.sample(sampler_EffectMap, u_xlat1.xz, bias(FGlobals._GlobalMipBias.xyxx.x)).yw;
                            u_xlat16_4.xy = u_xlat16_0.xx + u_xlat16_6.zx;
                            u_xlat16_4.xy = u_xlat16_4.xy + half2(-0.850000024, -0.699999988);
                            u_xlat16_4.xy = u_xlat16_4.xy * half2(20.0000191, 3.33333325);
                            u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0h, 1.0h);
                            u_xlat16_16.xy = fma(u_xlat16_4.xy, half2(-2.0, -2.0), half2(3.0, 3.0));
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_4.xy;
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_16.xy;
                            u_xlat16_21 = u_xlat16_4.y * u_xlat16_4.x;
                            u_xlat16_3.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
                            u_xlat16_2.xyz = fma(half3(u_xlat16_21), u_xlat16_3.xyz, u_xlat16_2.xyz);
                        }
                        u_xlat16_20 = u_xlat16_2.w * UnityPerMaterial._BaseColor.w;
                        u_xlatb0.x = FGlobals.unity_OrthoParams.w==0.0;
                        u_xlat1.xyz = (-input.TEXCOORD1.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
                        u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
                        u_xlat6 = rsqrt(u_xlat6);
                        u_xlat1.xyz = float3(u_xlat6) * u_xlat1.xyz;
                        u_xlat16_3.x = (u_xlatb0.x) ? half(u_xlat1.x) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z);
                        u_xlat16_3.y = (u_xlatb0.x) ? half(u_xlat1.y) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z);
                        u_xlat16_3.z = (u_xlatb0.x) ? half(u_xlat1.z) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z);
                        u_xlat0.x = dot(input.TEXCOORD2.xyz, input.TEXCOORD2.xyz);
                        u_xlat0.x = rsqrt(u_xlat0.x);
                        u_xlat0.xyw = u_xlat0.xxx * float3(input.TEXCOORD2.xyz);
                        u_xlat1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
                        u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
                        u_xlat1.x = rsqrt(u_xlat1.x);
                        u_xlat1.xyz = u_xlat1.xxx * float3(u_xlat16_3.xyz);
                        u_xlat16_5.xy = _RimMaskMap.sample(sampler_RimMaskMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                        u_xlat1.x = dot(u_xlat0.xyw, u_xlat1.xyz);
                        u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
                        u_xlat16_3.x = half((-u_xlat1.x) + 1.0);
                        u_xlat16_9.x = dot(UnityPerMaterial._RimVector.xyz, UnityPerMaterial._RimVector.xyz);
                        u_xlat16_9.x = rsqrt(u_xlat16_9.x);
                        u_xlat16_9.xyz = u_xlat16_9.xxx * UnityPerMaterial._RimVector.xyz;
                        u_xlat0.x = dot(u_xlat0.xyw, float3(u_xlat16_9.xyz));
                        u_xlat0.x = fma(u_xlat0.x, 0.5, 0.5);
                        u_xlat16_9.x = fma((-UnityPerMaterial._RimBoaderSmooth), half(0.5), half(0.5));
                        u_xlat16_3.z = fma(UnityPerMaterial._RimBoaderSmooth, half(0.5), half(0.5));
                        u_xlat16_21 = UnityPerMaterial._RimWidth + half(-0.5);
                        u_xlat16_3.x = half(fma(float(u_xlat16_3.x), u_xlat0.x, float(u_xlat16_21)));
                        u_xlat16_3.xz = (-u_xlat16_9.xx) + u_xlat16_3.xz;
                        u_xlat16_9.x = half(1.0) / u_xlat16_3.z;
                        u_xlat16_3.x = u_xlat16_9.x * u_xlat16_3.x;
                        u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0h, 1.0h);
                        u_xlat16_9.x = fma(u_xlat16_3.x, half(-2.0), half(3.0));
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
                        u_xlat16_9.x = (-u_xlat16_5.y) + half(1.0);
                        u_xlat16_3.x = max(u_xlat16_9.x, u_xlat16_3.x);
                        u_xlat16_9.xyz = UnityPerMaterial._BaseColor.xyz * UnityPerMaterial._RimColor.xyz;
                        u_xlat0.x = dot(UnityPerMaterial._BaseColor.xyz, half3(0.298999995, 0.587000012, 0.114));
                        u_xlat6 = fma((-u_xlat0.x), u_xlat0.x, u_xlat0.x);
                        u_xlat0.x = fma((-u_xlat6), (-float(UnityPerMaterial._RimBaseColorCurve)), u_xlat0.x);
                        u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
                        u_xlat0.x = u_xlat0.x * float(u_xlat16_3.x);
                        u_xlat1.xyz = float3(u_xlat16_5.xxx) * float3(u_xlat16_9.xyz);
                        u_xlat16_3.x = (-UnityPerMaterial._EnableEnemy) + half(1.0);
                        u_xlat1.xyz = u_xlat1.xyz * float3(u_xlat16_3.xxx);
                        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
                        u_xlat1.xyz = fma(float3(u_xlat16_2.xyz), float3(UnityPerMaterial._BaseColor.xyz), u_xlat1.xyz);
                        u_xlat16_2.xyz = (-UnityPerMaterial._SubColor.xyz) + half3(1.0, 1.0, 1.0);
                        u_xlat16_2.xyz = half3(fma(u_xlat0.xxx, float3(u_xlat16_2.xyz), float3(UnityPerMaterial._SubColor.xyz)));
                        u_xlat0.xyw = u_xlat1.xyz * float3(u_xlat16_2.xyz);
                        u_xlatb1 = UnityPerMaterial._EnableDissolve==half(1.0);
                        u_xlati7 = int((UnityPerMaterial._DissolveAlpha>=u_xlat16_20) ? 0xFFFFFFFFu : uint(0));
                        u_xlat16_2.x = (u_xlati7 != 0) ? half(1.0) : half(0.0);
                        u_xlatb7 = u_xlati7==0x0;
                        u_xlatb7 = u_xlatb1 && u_xlatb7;
                        if(((int(u_xlatb7) * int(0xffffffffu)))!=0){discard_fragment();}
                        u_xlat16_8 = (u_xlatb0.z) ? u_xlat16_20 : half(1.0);
                        output.SV_Target0.w = (u_xlatb1) ? u_xlat16_2.x : u_xlat16_8;
                        output.SV_Target0.xyz = half3(u_xlat0.xyw);
                        return output;
                    }
                    "
                }
                SubProgram "metal " {
                    Keywords { "_ADDITIONAL_LIGHTS" "_ENABLE_DITHER_BASECOLOR_ALPHA" "_MAIN_LIGHT_SHADOWS_CASCADE" "_SHADOWS_SOFT" }
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    constant float4 ImmCB_0[64] =
                    {
                    	float4(0.5, 0.0, 0.0, 0.0),
                    	float4(48.5, 0.0, 0.0, 0.0),
                    	float4(12.5, 0.0, 0.0, 0.0),
                    	float4(60.5, 0.0, 0.0, 0.0),
                    	float4(3.5, 0.0, 0.0, 0.0),
                    	float4(51.5, 0.0, 0.0, 0.0),
                    	float4(15.5, 0.0, 0.0, 0.0),
                    	float4(63.5, 0.0, 0.0, 0.0),
                    	float4(32.5, 0.0, 0.0, 0.0),
                    	float4(16.5, 0.0, 0.0, 0.0),
                    	float4(44.5, 0.0, 0.0, 0.0),
                    	float4(28.5, 0.0, 0.0, 0.0),
                    	float4(35.5, 0.0, 0.0, 0.0),
                    	float4(19.5, 0.0, 0.0, 0.0),
                    	float4(47.5, 0.0, 0.0, 0.0),
                    	float4(31.5, 0.0, 0.0, 0.0),
                    	float4(8.5, 0.0, 0.0, 0.0),
                    	float4(56.5, 0.0, 0.0, 0.0),
                    	float4(4.5, 0.0, 0.0, 0.0),
                    	float4(52.5, 0.0, 0.0, 0.0),
                    	float4(11.5, 0.0, 0.0, 0.0),
                    	float4(59.5, 0.0, 0.0, 0.0),
                    	float4(7.5, 0.0, 0.0, 0.0),
                    	float4(55.5, 0.0, 0.0, 0.0),
                    	float4(40.5, 0.0, 0.0, 0.0),
                    	float4(24.5, 0.0, 0.0, 0.0),
                    	float4(36.5, 0.0, 0.0, 0.0),
                    	float4(20.5, 0.0, 0.0, 0.0),
                    	float4(43.5, 0.0, 0.0, 0.0),
                    	float4(27.5, 0.0, 0.0, 0.0),
                    	float4(39.5, 0.0, 0.0, 0.0),
                    	float4(23.5, 0.0, 0.0, 0.0),
                    	float4(2.5, 0.0, 0.0, 0.0),
                    	float4(50.5, 0.0, 0.0, 0.0),
                    	float4(14.5, 0.0, 0.0, 0.0),
                    	float4(62.5, 0.0, 0.0, 0.0),
                    	float4(1.5, 0.0, 0.0, 0.0),
                    	float4(49.5, 0.0, 0.0, 0.0),
                    	float4(13.5, 0.0, 0.0, 0.0),
                    	float4(61.5, 0.0, 0.0, 0.0),
                    	float4(34.5, 0.0, 0.0, 0.0),
                    	float4(18.5, 0.0, 0.0, 0.0),
                    	float4(46.5, 0.0, 0.0, 0.0),
                    	float4(30.5, 0.0, 0.0, 0.0),
                    	float4(33.5, 0.0, 0.0, 0.0),
                    	float4(17.5, 0.0, 0.0, 0.0),
                    	float4(45.5, 0.0, 0.0, 0.0),
                    	float4(29.5, 0.0, 0.0, 0.0),
                    	float4(10.5, 0.0, 0.0, 0.0),
                    	float4(58.5, 0.0, 0.0, 0.0),
                    	float4(6.5, 0.0, 0.0, 0.0),
                    	float4(54.5, 0.0, 0.0, 0.0),
                    	float4(9.5, 0.0, 0.0, 0.0),
                    	float4(57.5, 0.0, 0.0, 0.0),
                    	float4(5.5, 0.0, 0.0, 0.0),
                    	float4(53.5, 0.0, 0.0, 0.0),
                    	float4(42.5, 0.0, 0.0, 0.0),
                    	float4(26.5, 0.0, 0.0, 0.0),
                    	float4(38.5, 0.0, 0.0, 0.0),
                    	float4(22.5, 0.0, 0.0, 0.0),
                    	float4(41.5, 0.0, 0.0, 0.0),
                    	float4(25.5, 0.0, 0.0, 0.0),
                    	float4(37.5, 0.0, 0.0, 0.0),
                    	float4(21.5, 0.0, 0.0, 0.0)
                    };
                    #ifndef XLT_REMAP_O
                    	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
                    #endif
                    constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
                    struct FGlobals_Type
                    {
                        float4 _Time;
                        float3 _WorldSpaceCameraPos;
                        float4 _ScreenParams;
                        float2 _GlobalMipBias;
                        float4 unity_OrthoParams;
                        float4 hlslcc_mtx4x4unity_MatrixV[4];
                    };
                    
                    struct UnityPerMaterial_Type
                    {
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_FragmentIn
                    {
                        float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
                        float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
                        half3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    		template <typename UVecType> UVecType bitFieldInsert(const UVecType width, const UVecType offset, const UVecType src2, const UVecType src3)
                    		{
                    			UVecType bitmask = (((UVecType(1) << width)-1) << offset) & 0xffffffff;
                    			return ((src2 << offset) & bitmask) | (src3 & ~bitmask);
                    		}; 
                    fragment Mtl_FragmentOut xlatMtlMain(
                        constant FGlobals_Type& FGlobals [[ buffer(0) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(1) ]],
                        sampler sampler_BaseMap [[ sampler (0) ]],
                        sampler sampler_RimMaskMap [[ sampler (1) ]],
                        sampler sampler_BaseMapEnemy [[ sampler (2) ]],
                        sampler sampler_EffectMap [[ sampler (3) ]],
                        texture2d<half, access::sample > _BaseMap [[ texture(0) ]] ,
                        texture2d<half, access::sample > _RimMaskMap [[ texture(1) ]] ,
                        texture2d<half, access::sample > _BaseMapEnemy [[ texture(2) ]] ,
                        texture2d<half, access::sample > _EffectMap [[ texture(3) ]] ,
                        float4 mtl_FragCoord [[ position ]],
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        float4 hlslcc_FragCoord = float4(mtl_FragCoord.xyz, 1.0/mtl_FragCoord.w);
                        float4 u_xlat0;
                        half2 u_xlat16_0;
                        bool3 u_xlatb0;
                        float4 u_xlat1;
                        half4 u_xlat16_1;
                        int u_xlati1;
                        uint2 u_xlatu1;
                        bool u_xlatb1;
                        half4 u_xlat16_2;
                        half3 u_xlat16_3;
                        half2 u_xlat16_4;
                        half2 u_xlat16_5;
                        float u_xlat6;
                        half3 u_xlat16_6;
                        int u_xlati7;
                        bool u_xlatb7;
                        half u_xlat16_8;
                        half3 u_xlat16_9;
                        half2 u_xlat16_16;
                        half u_xlat16_20;
                        half u_xlat16_21;
                        u_xlatb0.xyz = (half3(UnityPerMaterial._EnableEnemy, UnityPerMaterial._EnableEffect, UnityPerMaterial._Surface)==half3(1.0, 1.0, 1.0));
                        if(u_xlatb0.x){
                            u_xlat16_1 = _BaseMapEnemy.sample(sampler_BaseMapEnemy, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColorEnemy.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        } else {
                            u_xlat16_1 = _BaseMap.sample(sampler_BaseMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColor.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        }
                        if(u_xlatb0.y){
                            u_xlat1.yz = fma(FGlobals._Time.yy, float2(half2(UnityPerMaterial._EffectSpeedU, UnityPerMaterial._EffectSpeedV)), input.TEXCOORD0.zw);
                            u_xlat1.w = input.TEXCOORD0.w;
                            u_xlat16_0.xy = _EffectMap.sample(sampler_EffectMap, u_xlat1.yw, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                            u_xlat16_21 = u_xlat16_0.y + half(-0.5);
                            u_xlat16_21 = dot(half2(u_xlat16_21), half2(UnityPerMaterial._EffectDistortionIntensity));
                            u_xlat1.x = float(u_xlat16_21) + input.TEXCOORD0.z;
                            u_xlat16_6.xz = _EffectMap.sample(sampler_EffectMap, u_xlat1.xz, bias(FGlobals._GlobalMipBias.xyxx.x)).yw;
                            u_xlat16_4.xy = u_xlat16_0.xx + u_xlat16_6.zx;
                            u_xlat16_4.xy = u_xlat16_4.xy + half2(-0.850000024, -0.699999988);
                            u_xlat16_4.xy = u_xlat16_4.xy * half2(20.0000191, 3.33333325);
                            u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0h, 1.0h);
                            u_xlat16_16.xy = fma(u_xlat16_4.xy, half2(-2.0, -2.0), half2(3.0, 3.0));
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_4.xy;
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_16.xy;
                            u_xlat16_21 = u_xlat16_4.y * u_xlat16_4.x;
                            u_xlat16_3.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
                            u_xlat16_2.xyz = fma(half3(u_xlat16_21), u_xlat16_3.xyz, u_xlat16_2.xyz);
                        }
                        u_xlat16_20 = u_xlat16_2.w * UnityPerMaterial._BaseColor.w;
                        u_xlatb0.x = FGlobals.unity_OrthoParams.w==0.0;
                        u_xlat1.xyz = (-input.TEXCOORD1.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
                        u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
                        u_xlat6 = rsqrt(u_xlat6);
                        u_xlat1.xyz = float3(u_xlat6) * u_xlat1.xyz;
                        u_xlat16_3.x = (u_xlatb0.x) ? half(u_xlat1.x) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z);
                        u_xlat16_3.y = (u_xlatb0.x) ? half(u_xlat1.y) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z);
                        u_xlat16_3.z = (u_xlatb0.x) ? half(u_xlat1.z) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z);
                        u_xlat0.x = dot(input.TEXCOORD2.xyz, input.TEXCOORD2.xyz);
                        u_xlat0.x = rsqrt(u_xlat0.x);
                        u_xlat0.xyw = u_xlat0.xxx * float3(input.TEXCOORD2.xyz);
                        u_xlat1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
                        u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
                        u_xlat1.x = rsqrt(u_xlat1.x);
                        u_xlat1.xyz = u_xlat1.xxx * float3(u_xlat16_3.xyz);
                        u_xlat16_5.xy = _RimMaskMap.sample(sampler_RimMaskMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                        u_xlat1.x = dot(u_xlat0.xyw, u_xlat1.xyz);
                        u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
                        u_xlat16_3.x = half((-u_xlat1.x) + 1.0);
                        u_xlat16_9.x = dot(UnityPerMaterial._RimVector.xyz, UnityPerMaterial._RimVector.xyz);
                        u_xlat16_9.x = rsqrt(u_xlat16_9.x);
                        u_xlat16_9.xyz = u_xlat16_9.xxx * UnityPerMaterial._RimVector.xyz;
                        u_xlat0.x = dot(u_xlat0.xyw, float3(u_xlat16_9.xyz));
                        u_xlat0.x = fma(u_xlat0.x, 0.5, 0.5);
                        u_xlat16_9.x = fma((-UnityPerMaterial._RimBoaderSmooth), half(0.5), half(0.5));
                        u_xlat16_3.z = fma(UnityPerMaterial._RimBoaderSmooth, half(0.5), half(0.5));
                        u_xlat16_21 = UnityPerMaterial._RimWidth + half(-0.5);
                        u_xlat16_3.x = half(fma(float(u_xlat16_3.x), u_xlat0.x, float(u_xlat16_21)));
                        u_xlat16_3.xz = (-u_xlat16_9.xx) + u_xlat16_3.xz;
                        u_xlat16_9.x = half(1.0) / u_xlat16_3.z;
                        u_xlat16_3.x = u_xlat16_9.x * u_xlat16_3.x;
                        u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0h, 1.0h);
                        u_xlat16_9.x = fma(u_xlat16_3.x, half(-2.0), half(3.0));
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
                        u_xlat16_9.x = (-u_xlat16_5.y) + half(1.0);
                        u_xlat16_3.x = max(u_xlat16_9.x, u_xlat16_3.x);
                        u_xlat16_9.xyz = UnityPerMaterial._BaseColor.xyz * UnityPerMaterial._RimColor.xyz;
                        u_xlat0.x = dot(UnityPerMaterial._BaseColor.xyz, half3(0.298999995, 0.587000012, 0.114));
                        u_xlat6 = fma((-u_xlat0.x), u_xlat0.x, u_xlat0.x);
                        u_xlat0.x = fma((-u_xlat6), (-float(UnityPerMaterial._RimBaseColorCurve)), u_xlat0.x);
                        u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
                        u_xlat0.x = u_xlat0.x * float(u_xlat16_3.x);
                        u_xlat1.xyz = float3(u_xlat16_5.xxx) * float3(u_xlat16_9.xyz);
                        u_xlat16_3.x = (-UnityPerMaterial._EnableEnemy) + half(1.0);
                        u_xlat1.xyz = u_xlat1.xyz * float3(u_xlat16_3.xxx);
                        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
                        u_xlat1.xyz = fma(float3(u_xlat16_2.xyz), float3(UnityPerMaterial._BaseColor.xyz), u_xlat1.xyz);
                        u_xlat16_2.xyz = (-UnityPerMaterial._SubColor.xyz) + half3(1.0, 1.0, 1.0);
                        u_xlat16_2.xyz = half3(fma(u_xlat0.xxx, float3(u_xlat16_2.xyz), float3(UnityPerMaterial._SubColor.xyz)));
                        u_xlat0.xyw = u_xlat1.xyz * float3(u_xlat16_2.xyz);
                        u_xlat1.xy = FGlobals._ScreenParams.zw + float2(-1.0, -1.0);
                        u_xlat1.xy = u_xlat1.xy * hlslcc_FragCoord.xy;
                        u_xlat1.xy = u_xlat1.xy * FGlobals._ScreenParams.xy;
                        u_xlatu1.xy = uint2(u_xlat1.xy);
                        u_xlati1 = int(bitFieldInsert(0x3u, 0x3u, u_xlatu1.x, 0x0u));
                        u_xlati1 = int(bitFieldInsert(0x3u, 0x0u, u_xlatu1.y, uint(u_xlati1)));
                        u_xlat1.x = fma((-ImmCB_0[u_xlati1].x), 0.015625, float(u_xlat16_20));
                        u_xlatb1 = u_xlat1.x<0.0;
                        if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard_fragment();}
                        u_xlatb1 = UnityPerMaterial._EnableDissolve==half(1.0);
                        u_xlati7 = int((UnityPerMaterial._DissolveAlpha>=u_xlat16_20) ? 0xFFFFFFFFu : uint(0));
                        u_xlat16_2.x = (u_xlati7 != 0) ? half(1.0) : half(0.0);
                        u_xlatb7 = u_xlati7==0x0;
                        u_xlatb7 = u_xlatb1 && u_xlatb7;
                        if(((int(u_xlatb7) * int(0xffffffffu)))!=0){discard_fragment();}
                        u_xlat16_8 = (u_xlatb0.z) ? u_xlat16_20 : half(1.0);
                        output.SV_Target0.w = (u_xlatb1) ? u_xlat16_2.x : u_xlat16_8;
                        output.SV_Target0.xyz = half3(u_xlat0.xyw);
                        return output;
                    }
                    "
                }
                SubProgram "metal " {
                    Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS_CASCADE" "_SHADOWS_SOFT" }
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    #ifndef XLT_REMAP_O
                    	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
                    #endif
                    constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
                    struct FGlobals_Type
                    {
                        float4 _Time;
                        float3 _WorldSpaceCameraPos;
                        float2 _GlobalMipBias;
                        float4 unity_OrthoParams;
                        float4 hlslcc_mtx4x4unity_MatrixV[4];
                    };
                    
                    struct UnityPerMaterial_Type
                    {
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_FragmentIn
                    {
                        float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
                        float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
                        half3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    fragment Mtl_FragmentOut xlatMtlMain(
                        constant FGlobals_Type& FGlobals [[ buffer(0) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(1) ]],
                        sampler sampler_BaseMap [[ sampler (0) ]],
                        sampler sampler_RimMaskMap [[ sampler (1) ]],
                        sampler sampler_BaseMapEnemy [[ sampler (2) ]],
                        sampler sampler_EffectMap [[ sampler (3) ]],
                        texture2d<half, access::sample > _BaseMap [[ texture(0) ]] ,
                        texture2d<half, access::sample > _RimMaskMap [[ texture(1) ]] ,
                        texture2d<half, access::sample > _BaseMapEnemy [[ texture(2) ]] ,
                        texture2d<half, access::sample > _EffectMap [[ texture(3) ]] ,
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        float4 u_xlat0;
                        half2 u_xlat16_0;
                        bool3 u_xlatb0;
                        float4 u_xlat1;
                        half4 u_xlat16_1;
                        bool u_xlatb1;
                        half4 u_xlat16_2;
                        half3 u_xlat16_3;
                        half2 u_xlat16_4;
                        half2 u_xlat16_5;
                        float u_xlat6;
                        half3 u_xlat16_6;
                        int u_xlati7;
                        bool u_xlatb7;
                        half u_xlat16_8;
                        half3 u_xlat16_9;
                        half2 u_xlat16_16;
                        half u_xlat16_20;
                        half u_xlat16_21;
                        u_xlatb0.xyz = (half3(UnityPerMaterial._EnableEnemy, UnityPerMaterial._EnableEffect, UnityPerMaterial._Surface)==half3(1.0, 1.0, 1.0));
                        if(u_xlatb0.x){
                            u_xlat16_1 = _BaseMapEnemy.sample(sampler_BaseMapEnemy, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColorEnemy.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        } else {
                            u_xlat16_1 = _BaseMap.sample(sampler_BaseMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColor.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        }
                        if(u_xlatb0.y){
                            u_xlat1.yz = fma(FGlobals._Time.yy, float2(half2(UnityPerMaterial._EffectSpeedU, UnityPerMaterial._EffectSpeedV)), input.TEXCOORD0.zw);
                            u_xlat1.w = input.TEXCOORD0.w;
                            u_xlat16_0.xy = _EffectMap.sample(sampler_EffectMap, u_xlat1.yw, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                            u_xlat16_21 = u_xlat16_0.y + half(-0.5);
                            u_xlat16_21 = dot(half2(u_xlat16_21), half2(UnityPerMaterial._EffectDistortionIntensity));
                            u_xlat1.x = float(u_xlat16_21) + input.TEXCOORD0.z;
                            u_xlat16_6.xz = _EffectMap.sample(sampler_EffectMap, u_xlat1.xz, bias(FGlobals._GlobalMipBias.xyxx.x)).yw;
                            u_xlat16_4.xy = u_xlat16_0.xx + u_xlat16_6.zx;
                            u_xlat16_4.xy = u_xlat16_4.xy + half2(-0.850000024, -0.699999988);
                            u_xlat16_4.xy = u_xlat16_4.xy * half2(20.0000191, 3.33333325);
                            u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0h, 1.0h);
                            u_xlat16_16.xy = fma(u_xlat16_4.xy, half2(-2.0, -2.0), half2(3.0, 3.0));
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_4.xy;
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_16.xy;
                            u_xlat16_21 = u_xlat16_4.y * u_xlat16_4.x;
                            u_xlat16_3.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
                            u_xlat16_2.xyz = fma(half3(u_xlat16_21), u_xlat16_3.xyz, u_xlat16_2.xyz);
                        }
                        u_xlat16_20 = u_xlat16_2.w * UnityPerMaterial._BaseColor.w;
                        u_xlatb0.x = FGlobals.unity_OrthoParams.w==0.0;
                        u_xlat1.xyz = (-input.TEXCOORD1.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
                        u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
                        u_xlat6 = rsqrt(u_xlat6);
                        u_xlat1.xyz = float3(u_xlat6) * u_xlat1.xyz;
                        u_xlat16_3.x = (u_xlatb0.x) ? half(u_xlat1.x) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z);
                        u_xlat16_3.y = (u_xlatb0.x) ? half(u_xlat1.y) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z);
                        u_xlat16_3.z = (u_xlatb0.x) ? half(u_xlat1.z) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z);
                        u_xlat0.x = dot(input.TEXCOORD2.xyz, input.TEXCOORD2.xyz);
                        u_xlat0.x = rsqrt(u_xlat0.x);
                        u_xlat0.xyw = u_xlat0.xxx * float3(input.TEXCOORD2.xyz);
                        u_xlat1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
                        u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
                        u_xlat1.x = rsqrt(u_xlat1.x);
                        u_xlat1.xyz = u_xlat1.xxx * float3(u_xlat16_3.xyz);
                        u_xlat16_5.xy = _RimMaskMap.sample(sampler_RimMaskMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                        u_xlat1.x = dot(u_xlat0.xyw, u_xlat1.xyz);
                        u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
                        u_xlat16_3.x = half((-u_xlat1.x) + 1.0);
                        u_xlat16_9.x = dot(UnityPerMaterial._RimVector.xyz, UnityPerMaterial._RimVector.xyz);
                        u_xlat16_9.x = rsqrt(u_xlat16_9.x);
                        u_xlat16_9.xyz = u_xlat16_9.xxx * UnityPerMaterial._RimVector.xyz;
                        u_xlat0.x = dot(u_xlat0.xyw, float3(u_xlat16_9.xyz));
                        u_xlat0.x = fma(u_xlat0.x, 0.5, 0.5);
                        u_xlat16_9.x = fma((-UnityPerMaterial._RimBoaderSmooth), half(0.5), half(0.5));
                        u_xlat16_3.z = fma(UnityPerMaterial._RimBoaderSmooth, half(0.5), half(0.5));
                        u_xlat16_21 = UnityPerMaterial._RimWidth + half(-0.5);
                        u_xlat16_3.x = half(fma(float(u_xlat16_3.x), u_xlat0.x, float(u_xlat16_21)));
                        u_xlat16_3.xz = (-u_xlat16_9.xx) + u_xlat16_3.xz;
                        u_xlat16_9.x = half(1.0) / u_xlat16_3.z;
                        u_xlat16_3.x = u_xlat16_9.x * u_xlat16_3.x;
                        u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0h, 1.0h);
                        u_xlat16_9.x = fma(u_xlat16_3.x, half(-2.0), half(3.0));
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
                        u_xlat16_9.x = (-u_xlat16_5.y) + half(1.0);
                        u_xlat16_3.x = max(u_xlat16_9.x, u_xlat16_3.x);
                        u_xlat16_9.xyz = UnityPerMaterial._BaseColor.xyz * UnityPerMaterial._RimColor.xyz;
                        u_xlat0.x = dot(UnityPerMaterial._BaseColor.xyz, half3(0.298999995, 0.587000012, 0.114));
                        u_xlat6 = fma((-u_xlat0.x), u_xlat0.x, u_xlat0.x);
                        u_xlat0.x = fma((-u_xlat6), (-float(UnityPerMaterial._RimBaseColorCurve)), u_xlat0.x);
                        u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
                        u_xlat0.x = u_xlat0.x * float(u_xlat16_3.x);
                        u_xlat1.xyz = float3(u_xlat16_5.xxx) * float3(u_xlat16_9.xyz);
                        u_xlat16_3.x = (-UnityPerMaterial._EnableEnemy) + half(1.0);
                        u_xlat1.xyz = u_xlat1.xyz * float3(u_xlat16_3.xxx);
                        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
                        u_xlat1.xyz = fma(float3(u_xlat16_2.xyz), float3(UnityPerMaterial._BaseColor.xyz), u_xlat1.xyz);
                        u_xlat16_2.xyz = (-UnityPerMaterial._SubColor.xyz) + half3(1.0, 1.0, 1.0);
                        u_xlat16_2.xyz = half3(fma(u_xlat0.xxx, float3(u_xlat16_2.xyz), float3(UnityPerMaterial._SubColor.xyz)));
                        u_xlat0.xyw = u_xlat1.xyz * float3(u_xlat16_2.xyz);
                        u_xlatb1 = UnityPerMaterial._EnableDissolve==half(1.0);
                        u_xlati7 = int((UnityPerMaterial._DissolveAlpha>=u_xlat16_20) ? 0xFFFFFFFFu : uint(0));
                        u_xlat16_2.x = (u_xlati7 != 0) ? half(1.0) : half(0.0);
                        u_xlatb7 = u_xlati7==0x0;
                        u_xlatb7 = u_xlatb1 && u_xlatb7;
                        if(((int(u_xlatb7) * int(0xffffffffu)))!=0){discard_fragment();}
                        u_xlat16_8 = (u_xlatb0.z) ? u_xlat16_20 : half(1.0);
                        output.SV_Target0.w = (u_xlatb1) ? u_xlat16_2.x : u_xlat16_8;
                        output.SV_Target0.xyz = half3(u_xlat0.xyw);
                        return output;
                    }
                    "
                }
                SubProgram "metal " {
                    Keywords { "_ADDITIONAL_LIGHTS" "_ENABLE_DITHER_BASECOLOR_ALPHA" "_LIGHT_COOKIES" "_MAIN_LIGHT_SHADOWS_CASCADE" }
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    constant float4 ImmCB_0[64] =
                    {
                    	float4(0.5, 0.0, 0.0, 0.0),
                    	float4(48.5, 0.0, 0.0, 0.0),
                    	float4(12.5, 0.0, 0.0, 0.0),
                    	float4(60.5, 0.0, 0.0, 0.0),
                    	float4(3.5, 0.0, 0.0, 0.0),
                    	float4(51.5, 0.0, 0.0, 0.0),
                    	float4(15.5, 0.0, 0.0, 0.0),
                    	float4(63.5, 0.0, 0.0, 0.0),
                    	float4(32.5, 0.0, 0.0, 0.0),
                    	float4(16.5, 0.0, 0.0, 0.0),
                    	float4(44.5, 0.0, 0.0, 0.0),
                    	float4(28.5, 0.0, 0.0, 0.0),
                    	float4(35.5, 0.0, 0.0, 0.0),
                    	float4(19.5, 0.0, 0.0, 0.0),
                    	float4(47.5, 0.0, 0.0, 0.0),
                    	float4(31.5, 0.0, 0.0, 0.0),
                    	float4(8.5, 0.0, 0.0, 0.0),
                    	float4(56.5, 0.0, 0.0, 0.0),
                    	float4(4.5, 0.0, 0.0, 0.0),
                    	float4(52.5, 0.0, 0.0, 0.0),
                    	float4(11.5, 0.0, 0.0, 0.0),
                    	float4(59.5, 0.0, 0.0, 0.0),
                    	float4(7.5, 0.0, 0.0, 0.0),
                    	float4(55.5, 0.0, 0.0, 0.0),
                    	float4(40.5, 0.0, 0.0, 0.0),
                    	float4(24.5, 0.0, 0.0, 0.0),
                    	float4(36.5, 0.0, 0.0, 0.0),
                    	float4(20.5, 0.0, 0.0, 0.0),
                    	float4(43.5, 0.0, 0.0, 0.0),
                    	float4(27.5, 0.0, 0.0, 0.0),
                    	float4(39.5, 0.0, 0.0, 0.0),
                    	float4(23.5, 0.0, 0.0, 0.0),
                    	float4(2.5, 0.0, 0.0, 0.0),
                    	float4(50.5, 0.0, 0.0, 0.0),
                    	float4(14.5, 0.0, 0.0, 0.0),
                    	float4(62.5, 0.0, 0.0, 0.0),
                    	float4(1.5, 0.0, 0.0, 0.0),
                    	float4(49.5, 0.0, 0.0, 0.0),
                    	float4(13.5, 0.0, 0.0, 0.0),
                    	float4(61.5, 0.0, 0.0, 0.0),
                    	float4(34.5, 0.0, 0.0, 0.0),
                    	float4(18.5, 0.0, 0.0, 0.0),
                    	float4(46.5, 0.0, 0.0, 0.0),
                    	float4(30.5, 0.0, 0.0, 0.0),
                    	float4(33.5, 0.0, 0.0, 0.0),
                    	float4(17.5, 0.0, 0.0, 0.0),
                    	float4(45.5, 0.0, 0.0, 0.0),
                    	float4(29.5, 0.0, 0.0, 0.0),
                    	float4(10.5, 0.0, 0.0, 0.0),
                    	float4(58.5, 0.0, 0.0, 0.0),
                    	float4(6.5, 0.0, 0.0, 0.0),
                    	float4(54.5, 0.0, 0.0, 0.0),
                    	float4(9.5, 0.0, 0.0, 0.0),
                    	float4(57.5, 0.0, 0.0, 0.0),
                    	float4(5.5, 0.0, 0.0, 0.0),
                    	float4(53.5, 0.0, 0.0, 0.0),
                    	float4(42.5, 0.0, 0.0, 0.0),
                    	float4(26.5, 0.0, 0.0, 0.0),
                    	float4(38.5, 0.0, 0.0, 0.0),
                    	float4(22.5, 0.0, 0.0, 0.0),
                    	float4(41.5, 0.0, 0.0, 0.0),
                    	float4(25.5, 0.0, 0.0, 0.0),
                    	float4(37.5, 0.0, 0.0, 0.0),
                    	float4(21.5, 0.0, 0.0, 0.0)
                    };
                    #ifndef XLT_REMAP_O
                    	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
                    #endif
                    constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
                    struct FGlobals_Type
                    {
                        float4 _Time;
                        float3 _WorldSpaceCameraPos;
                        float4 _ScreenParams;
                        float2 _GlobalMipBias;
                        float4 unity_OrthoParams;
                        float4 hlslcc_mtx4x4unity_MatrixV[4];
                    };
                    
                    struct UnityPerMaterial_Type
                    {
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_FragmentIn
                    {
                        float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
                        float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
                        half3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    		template <typename UVecType> UVecType bitFieldInsert(const UVecType width, const UVecType offset, const UVecType src2, const UVecType src3)
                    		{
                    			UVecType bitmask = (((UVecType(1) << width)-1) << offset) & 0xffffffff;
                    			return ((src2 << offset) & bitmask) | (src3 & ~bitmask);
                    		}; 
                    fragment Mtl_FragmentOut xlatMtlMain(
                        constant FGlobals_Type& FGlobals [[ buffer(0) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(1) ]],
                        sampler sampler_BaseMap [[ sampler (0) ]],
                        sampler sampler_RimMaskMap [[ sampler (1) ]],
                        sampler sampler_BaseMapEnemy [[ sampler (2) ]],
                        sampler sampler_EffectMap [[ sampler (3) ]],
                        texture2d<half, access::sample > _BaseMap [[ texture(0) ]] ,
                        texture2d<half, access::sample > _RimMaskMap [[ texture(1) ]] ,
                        texture2d<half, access::sample > _BaseMapEnemy [[ texture(2) ]] ,
                        texture2d<half, access::sample > _EffectMap [[ texture(3) ]] ,
                        float4 mtl_FragCoord [[ position ]],
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        float4 hlslcc_FragCoord = float4(mtl_FragCoord.xyz, 1.0/mtl_FragCoord.w);
                        float4 u_xlat0;
                        half2 u_xlat16_0;
                        bool3 u_xlatb0;
                        float4 u_xlat1;
                        half4 u_xlat16_1;
                        int u_xlati1;
                        uint2 u_xlatu1;
                        bool u_xlatb1;
                        half4 u_xlat16_2;
                        half3 u_xlat16_3;
                        half2 u_xlat16_4;
                        half2 u_xlat16_5;
                        float u_xlat6;
                        half3 u_xlat16_6;
                        int u_xlati7;
                        bool u_xlatb7;
                        half u_xlat16_8;
                        half3 u_xlat16_9;
                        half2 u_xlat16_16;
                        half u_xlat16_20;
                        half u_xlat16_21;
                        u_xlatb0.xyz = (half3(UnityPerMaterial._EnableEnemy, UnityPerMaterial._EnableEffect, UnityPerMaterial._Surface)==half3(1.0, 1.0, 1.0));
                        if(u_xlatb0.x){
                            u_xlat16_1 = _BaseMapEnemy.sample(sampler_BaseMapEnemy, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColorEnemy.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        } else {
                            u_xlat16_1 = _BaseMap.sample(sampler_BaseMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColor.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        }
                        if(u_xlatb0.y){
                            u_xlat1.yz = fma(FGlobals._Time.yy, float2(half2(UnityPerMaterial._EffectSpeedU, UnityPerMaterial._EffectSpeedV)), input.TEXCOORD0.zw);
                            u_xlat1.w = input.TEXCOORD0.w;
                            u_xlat16_0.xy = _EffectMap.sample(sampler_EffectMap, u_xlat1.yw, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                            u_xlat16_21 = u_xlat16_0.y + half(-0.5);
                            u_xlat16_21 = dot(half2(u_xlat16_21), half2(UnityPerMaterial._EffectDistortionIntensity));
                            u_xlat1.x = float(u_xlat16_21) + input.TEXCOORD0.z;
                            u_xlat16_6.xz = _EffectMap.sample(sampler_EffectMap, u_xlat1.xz, bias(FGlobals._GlobalMipBias.xyxx.x)).yw;
                            u_xlat16_4.xy = u_xlat16_0.xx + u_xlat16_6.zx;
                            u_xlat16_4.xy = u_xlat16_4.xy + half2(-0.850000024, -0.699999988);
                            u_xlat16_4.xy = u_xlat16_4.xy * half2(20.0000191, 3.33333325);
                            u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0h, 1.0h);
                            u_xlat16_16.xy = fma(u_xlat16_4.xy, half2(-2.0, -2.0), half2(3.0, 3.0));
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_4.xy;
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_16.xy;
                            u_xlat16_21 = u_xlat16_4.y * u_xlat16_4.x;
                            u_xlat16_3.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
                            u_xlat16_2.xyz = fma(half3(u_xlat16_21), u_xlat16_3.xyz, u_xlat16_2.xyz);
                        }
                        u_xlat16_20 = u_xlat16_2.w * UnityPerMaterial._BaseColor.w;
                        u_xlatb0.x = FGlobals.unity_OrthoParams.w==0.0;
                        u_xlat1.xyz = (-input.TEXCOORD1.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
                        u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
                        u_xlat6 = rsqrt(u_xlat6);
                        u_xlat1.xyz = float3(u_xlat6) * u_xlat1.xyz;
                        u_xlat16_3.x = (u_xlatb0.x) ? half(u_xlat1.x) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z);
                        u_xlat16_3.y = (u_xlatb0.x) ? half(u_xlat1.y) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z);
                        u_xlat16_3.z = (u_xlatb0.x) ? half(u_xlat1.z) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z);
                        u_xlat0.x = dot(input.TEXCOORD2.xyz, input.TEXCOORD2.xyz);
                        u_xlat0.x = rsqrt(u_xlat0.x);
                        u_xlat0.xyw = u_xlat0.xxx * float3(input.TEXCOORD2.xyz);
                        u_xlat1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
                        u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
                        u_xlat1.x = rsqrt(u_xlat1.x);
                        u_xlat1.xyz = u_xlat1.xxx * float3(u_xlat16_3.xyz);
                        u_xlat16_5.xy = _RimMaskMap.sample(sampler_RimMaskMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                        u_xlat1.x = dot(u_xlat0.xyw, u_xlat1.xyz);
                        u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
                        u_xlat16_3.x = half((-u_xlat1.x) + 1.0);
                        u_xlat16_9.x = dot(UnityPerMaterial._RimVector.xyz, UnityPerMaterial._RimVector.xyz);
                        u_xlat16_9.x = rsqrt(u_xlat16_9.x);
                        u_xlat16_9.xyz = u_xlat16_9.xxx * UnityPerMaterial._RimVector.xyz;
                        u_xlat0.x = dot(u_xlat0.xyw, float3(u_xlat16_9.xyz));
                        u_xlat0.x = fma(u_xlat0.x, 0.5, 0.5);
                        u_xlat16_9.x = fma((-UnityPerMaterial._RimBoaderSmooth), half(0.5), half(0.5));
                        u_xlat16_3.z = fma(UnityPerMaterial._RimBoaderSmooth, half(0.5), half(0.5));
                        u_xlat16_21 = UnityPerMaterial._RimWidth + half(-0.5);
                        u_xlat16_3.x = half(fma(float(u_xlat16_3.x), u_xlat0.x, float(u_xlat16_21)));
                        u_xlat16_3.xz = (-u_xlat16_9.xx) + u_xlat16_3.xz;
                        u_xlat16_9.x = half(1.0) / u_xlat16_3.z;
                        u_xlat16_3.x = u_xlat16_9.x * u_xlat16_3.x;
                        u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0h, 1.0h);
                        u_xlat16_9.x = fma(u_xlat16_3.x, half(-2.0), half(3.0));
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
                        u_xlat16_9.x = (-u_xlat16_5.y) + half(1.0);
                        u_xlat16_3.x = max(u_xlat16_9.x, u_xlat16_3.x);
                        u_xlat16_9.xyz = UnityPerMaterial._BaseColor.xyz * UnityPerMaterial._RimColor.xyz;
                        u_xlat0.x = dot(UnityPerMaterial._BaseColor.xyz, half3(0.298999995, 0.587000012, 0.114));
                        u_xlat6 = fma((-u_xlat0.x), u_xlat0.x, u_xlat0.x);
                        u_xlat0.x = fma((-u_xlat6), (-float(UnityPerMaterial._RimBaseColorCurve)), u_xlat0.x);
                        u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
                        u_xlat0.x = u_xlat0.x * float(u_xlat16_3.x);
                        u_xlat1.xyz = float3(u_xlat16_5.xxx) * float3(u_xlat16_9.xyz);
                        u_xlat16_3.x = (-UnityPerMaterial._EnableEnemy) + half(1.0);
                        u_xlat1.xyz = u_xlat1.xyz * float3(u_xlat16_3.xxx);
                        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
                        u_xlat1.xyz = fma(float3(u_xlat16_2.xyz), float3(UnityPerMaterial._BaseColor.xyz), u_xlat1.xyz);
                        u_xlat16_2.xyz = (-UnityPerMaterial._SubColor.xyz) + half3(1.0, 1.0, 1.0);
                        u_xlat16_2.xyz = half3(fma(u_xlat0.xxx, float3(u_xlat16_2.xyz), float3(UnityPerMaterial._SubColor.xyz)));
                        u_xlat0.xyw = u_xlat1.xyz * float3(u_xlat16_2.xyz);
                        u_xlat1.xy = FGlobals._ScreenParams.zw + float2(-1.0, -1.0);
                        u_xlat1.xy = u_xlat1.xy * hlslcc_FragCoord.xy;
                        u_xlat1.xy = u_xlat1.xy * FGlobals._ScreenParams.xy;
                        u_xlatu1.xy = uint2(u_xlat1.xy);
                        u_xlati1 = int(bitFieldInsert(0x3u, 0x3u, u_xlatu1.x, 0x0u));
                        u_xlati1 = int(bitFieldInsert(0x3u, 0x0u, u_xlatu1.y, uint(u_xlati1)));
                        u_xlat1.x = fma((-ImmCB_0[u_xlati1].x), 0.015625, float(u_xlat16_20));
                        u_xlatb1 = u_xlat1.x<0.0;
                        if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard_fragment();}
                        u_xlatb1 = UnityPerMaterial._EnableDissolve==half(1.0);
                        u_xlati7 = int((UnityPerMaterial._DissolveAlpha>=u_xlat16_20) ? 0xFFFFFFFFu : uint(0));
                        u_xlat16_2.x = (u_xlati7 != 0) ? half(1.0) : half(0.0);
                        u_xlatb7 = u_xlati7==0x0;
                        u_xlatb7 = u_xlatb1 && u_xlatb7;
                        if(((int(u_xlatb7) * int(0xffffffffu)))!=0){discard_fragment();}
                        u_xlat16_8 = (u_xlatb0.z) ? u_xlat16_20 : half(1.0);
                        output.SV_Target0.w = (u_xlatb1) ? u_xlat16_2.x : u_xlat16_8;
                        output.SV_Target0.xyz = half3(u_xlat0.xyw);
                        return output;
                    }
                    "
                }
                SubProgram "metal " {
                    Keywords { "_ADDITIONAL_LIGHTS" "_LIGHT_COOKIES" "_MAIN_LIGHT_SHADOWS_CASCADE" }
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    #ifndef XLT_REMAP_O
                    	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
                    #endif
                    constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
                    struct FGlobals_Type
                    {
                        float4 _Time;
                        float3 _WorldSpaceCameraPos;
                        float2 _GlobalMipBias;
                        float4 unity_OrthoParams;
                        float4 hlslcc_mtx4x4unity_MatrixV[4];
                    };
                    
                    struct UnityPerMaterial_Type
                    {
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_FragmentIn
                    {
                        float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
                        float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
                        half3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    fragment Mtl_FragmentOut xlatMtlMain(
                        constant FGlobals_Type& FGlobals [[ buffer(0) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(1) ]],
                        sampler sampler_BaseMap [[ sampler (0) ]],
                        sampler sampler_RimMaskMap [[ sampler (1) ]],
                        sampler sampler_BaseMapEnemy [[ sampler (2) ]],
                        sampler sampler_EffectMap [[ sampler (3) ]],
                        texture2d<half, access::sample > _BaseMap [[ texture(0) ]] ,
                        texture2d<half, access::sample > _RimMaskMap [[ texture(1) ]] ,
                        texture2d<half, access::sample > _BaseMapEnemy [[ texture(2) ]] ,
                        texture2d<half, access::sample > _EffectMap [[ texture(3) ]] ,
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        float4 u_xlat0;
                        half2 u_xlat16_0;
                        bool3 u_xlatb0;
                        float4 u_xlat1;
                        half4 u_xlat16_1;
                        bool u_xlatb1;
                        half4 u_xlat16_2;
                        half3 u_xlat16_3;
                        half2 u_xlat16_4;
                        half2 u_xlat16_5;
                        float u_xlat6;
                        half3 u_xlat16_6;
                        int u_xlati7;
                        bool u_xlatb7;
                        half u_xlat16_8;
                        half3 u_xlat16_9;
                        half2 u_xlat16_16;
                        half u_xlat16_20;
                        half u_xlat16_21;
                        u_xlatb0.xyz = (half3(UnityPerMaterial._EnableEnemy, UnityPerMaterial._EnableEffect, UnityPerMaterial._Surface)==half3(1.0, 1.0, 1.0));
                        if(u_xlatb0.x){
                            u_xlat16_1 = _BaseMapEnemy.sample(sampler_BaseMapEnemy, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColorEnemy.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        } else {
                            u_xlat16_1 = _BaseMap.sample(sampler_BaseMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColor.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        }
                        if(u_xlatb0.y){
                            u_xlat1.yz = fma(FGlobals._Time.yy, float2(half2(UnityPerMaterial._EffectSpeedU, UnityPerMaterial._EffectSpeedV)), input.TEXCOORD0.zw);
                            u_xlat1.w = input.TEXCOORD0.w;
                            u_xlat16_0.xy = _EffectMap.sample(sampler_EffectMap, u_xlat1.yw, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                            u_xlat16_21 = u_xlat16_0.y + half(-0.5);
                            u_xlat16_21 = dot(half2(u_xlat16_21), half2(UnityPerMaterial._EffectDistortionIntensity));
                            u_xlat1.x = float(u_xlat16_21) + input.TEXCOORD0.z;
                            u_xlat16_6.xz = _EffectMap.sample(sampler_EffectMap, u_xlat1.xz, bias(FGlobals._GlobalMipBias.xyxx.x)).yw;
                            u_xlat16_4.xy = u_xlat16_0.xx + u_xlat16_6.zx;
                            u_xlat16_4.xy = u_xlat16_4.xy + half2(-0.850000024, -0.699999988);
                            u_xlat16_4.xy = u_xlat16_4.xy * half2(20.0000191, 3.33333325);
                            u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0h, 1.0h);
                            u_xlat16_16.xy = fma(u_xlat16_4.xy, half2(-2.0, -2.0), half2(3.0, 3.0));
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_4.xy;
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_16.xy;
                            u_xlat16_21 = u_xlat16_4.y * u_xlat16_4.x;
                            u_xlat16_3.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
                            u_xlat16_2.xyz = fma(half3(u_xlat16_21), u_xlat16_3.xyz, u_xlat16_2.xyz);
                        }
                        u_xlat16_20 = u_xlat16_2.w * UnityPerMaterial._BaseColor.w;
                        u_xlatb0.x = FGlobals.unity_OrthoParams.w==0.0;
                        u_xlat1.xyz = (-input.TEXCOORD1.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
                        u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
                        u_xlat6 = rsqrt(u_xlat6);
                        u_xlat1.xyz = float3(u_xlat6) * u_xlat1.xyz;
                        u_xlat16_3.x = (u_xlatb0.x) ? half(u_xlat1.x) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z);
                        u_xlat16_3.y = (u_xlatb0.x) ? half(u_xlat1.y) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z);
                        u_xlat16_3.z = (u_xlatb0.x) ? half(u_xlat1.z) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z);
                        u_xlat0.x = dot(input.TEXCOORD2.xyz, input.TEXCOORD2.xyz);
                        u_xlat0.x = rsqrt(u_xlat0.x);
                        u_xlat0.xyw = u_xlat0.xxx * float3(input.TEXCOORD2.xyz);
                        u_xlat1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
                        u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
                        u_xlat1.x = rsqrt(u_xlat1.x);
                        u_xlat1.xyz = u_xlat1.xxx * float3(u_xlat16_3.xyz);
                        u_xlat16_5.xy = _RimMaskMap.sample(sampler_RimMaskMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                        u_xlat1.x = dot(u_xlat0.xyw, u_xlat1.xyz);
                        u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
                        u_xlat16_3.x = half((-u_xlat1.x) + 1.0);
                        u_xlat16_9.x = dot(UnityPerMaterial._RimVector.xyz, UnityPerMaterial._RimVector.xyz);
                        u_xlat16_9.x = rsqrt(u_xlat16_9.x);
                        u_xlat16_9.xyz = u_xlat16_9.xxx * UnityPerMaterial._RimVector.xyz;
                        u_xlat0.x = dot(u_xlat0.xyw, float3(u_xlat16_9.xyz));
                        u_xlat0.x = fma(u_xlat0.x, 0.5, 0.5);
                        u_xlat16_9.x = fma((-UnityPerMaterial._RimBoaderSmooth), half(0.5), half(0.5));
                        u_xlat16_3.z = fma(UnityPerMaterial._RimBoaderSmooth, half(0.5), half(0.5));
                        u_xlat16_21 = UnityPerMaterial._RimWidth + half(-0.5);
                        u_xlat16_3.x = half(fma(float(u_xlat16_3.x), u_xlat0.x, float(u_xlat16_21)));
                        u_xlat16_3.xz = (-u_xlat16_9.xx) + u_xlat16_3.xz;
                        u_xlat16_9.x = half(1.0) / u_xlat16_3.z;
                        u_xlat16_3.x = u_xlat16_9.x * u_xlat16_3.x;
                        u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0h, 1.0h);
                        u_xlat16_9.x = fma(u_xlat16_3.x, half(-2.0), half(3.0));
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
                        u_xlat16_9.x = (-u_xlat16_5.y) + half(1.0);
                        u_xlat16_3.x = max(u_xlat16_9.x, u_xlat16_3.x);
                        u_xlat16_9.xyz = UnityPerMaterial._BaseColor.xyz * UnityPerMaterial._RimColor.xyz;
                        u_xlat0.x = dot(UnityPerMaterial._BaseColor.xyz, half3(0.298999995, 0.587000012, 0.114));
                        u_xlat6 = fma((-u_xlat0.x), u_xlat0.x, u_xlat0.x);
                        u_xlat0.x = fma((-u_xlat6), (-float(UnityPerMaterial._RimBaseColorCurve)), u_xlat0.x);
                        u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
                        u_xlat0.x = u_xlat0.x * float(u_xlat16_3.x);
                        u_xlat1.xyz = float3(u_xlat16_5.xxx) * float3(u_xlat16_9.xyz);
                        u_xlat16_3.x = (-UnityPerMaterial._EnableEnemy) + half(1.0);
                        u_xlat1.xyz = u_xlat1.xyz * float3(u_xlat16_3.xxx);
                        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
                        u_xlat1.xyz = fma(float3(u_xlat16_2.xyz), float3(UnityPerMaterial._BaseColor.xyz), u_xlat1.xyz);
                        u_xlat16_2.xyz = (-UnityPerMaterial._SubColor.xyz) + half3(1.0, 1.0, 1.0);
                        u_xlat16_2.xyz = half3(fma(u_xlat0.xxx, float3(u_xlat16_2.xyz), float3(UnityPerMaterial._SubColor.xyz)));
                        u_xlat0.xyw = u_xlat1.xyz * float3(u_xlat16_2.xyz);
                        u_xlatb1 = UnityPerMaterial._EnableDissolve==half(1.0);
                        u_xlati7 = int((UnityPerMaterial._DissolveAlpha>=u_xlat16_20) ? 0xFFFFFFFFu : uint(0));
                        u_xlat16_2.x = (u_xlati7 != 0) ? half(1.0) : half(0.0);
                        u_xlatb7 = u_xlati7==0x0;
                        u_xlatb7 = u_xlatb1 && u_xlatb7;
                        if(((int(u_xlatb7) * int(0xffffffffu)))!=0){discard_fragment();}
                        u_xlat16_8 = (u_xlatb0.z) ? u_xlat16_20 : half(1.0);
                        output.SV_Target0.w = (u_xlatb1) ? u_xlat16_2.x : u_xlat16_8;
                        output.SV_Target0.xyz = half3(u_xlat0.xyw);
                        return output;
                    }
                    "
                }
                SubProgram "metal " {
                    Keywords { "_ADDITIONAL_LIGHTS" "_ENABLE_DITHER_BASECOLOR_ALPHA" "_MAIN_LIGHT_SHADOWS_CASCADE" }
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    constant float4 ImmCB_0[64] =
                    {
                    	float4(0.5, 0.0, 0.0, 0.0),
                    	float4(48.5, 0.0, 0.0, 0.0),
                    	float4(12.5, 0.0, 0.0, 0.0),
                    	float4(60.5, 0.0, 0.0, 0.0),
                    	float4(3.5, 0.0, 0.0, 0.0),
                    	float4(51.5, 0.0, 0.0, 0.0),
                    	float4(15.5, 0.0, 0.0, 0.0),
                    	float4(63.5, 0.0, 0.0, 0.0),
                    	float4(32.5, 0.0, 0.0, 0.0),
                    	float4(16.5, 0.0, 0.0, 0.0),
                    	float4(44.5, 0.0, 0.0, 0.0),
                    	float4(28.5, 0.0, 0.0, 0.0),
                    	float4(35.5, 0.0, 0.0, 0.0),
                    	float4(19.5, 0.0, 0.0, 0.0),
                    	float4(47.5, 0.0, 0.0, 0.0),
                    	float4(31.5, 0.0, 0.0, 0.0),
                    	float4(8.5, 0.0, 0.0, 0.0),
                    	float4(56.5, 0.0, 0.0, 0.0),
                    	float4(4.5, 0.0, 0.0, 0.0),
                    	float4(52.5, 0.0, 0.0, 0.0),
                    	float4(11.5, 0.0, 0.0, 0.0),
                    	float4(59.5, 0.0, 0.0, 0.0),
                    	float4(7.5, 0.0, 0.0, 0.0),
                    	float4(55.5, 0.0, 0.0, 0.0),
                    	float4(40.5, 0.0, 0.0, 0.0),
                    	float4(24.5, 0.0, 0.0, 0.0),
                    	float4(36.5, 0.0, 0.0, 0.0),
                    	float4(20.5, 0.0, 0.0, 0.0),
                    	float4(43.5, 0.0, 0.0, 0.0),
                    	float4(27.5, 0.0, 0.0, 0.0),
                    	float4(39.5, 0.0, 0.0, 0.0),
                    	float4(23.5, 0.0, 0.0, 0.0),
                    	float4(2.5, 0.0, 0.0, 0.0),
                    	float4(50.5, 0.0, 0.0, 0.0),
                    	float4(14.5, 0.0, 0.0, 0.0),
                    	float4(62.5, 0.0, 0.0, 0.0),
                    	float4(1.5, 0.0, 0.0, 0.0),
                    	float4(49.5, 0.0, 0.0, 0.0),
                    	float4(13.5, 0.0, 0.0, 0.0),
                    	float4(61.5, 0.0, 0.0, 0.0),
                    	float4(34.5, 0.0, 0.0, 0.0),
                    	float4(18.5, 0.0, 0.0, 0.0),
                    	float4(46.5, 0.0, 0.0, 0.0),
                    	float4(30.5, 0.0, 0.0, 0.0),
                    	float4(33.5, 0.0, 0.0, 0.0),
                    	float4(17.5, 0.0, 0.0, 0.0),
                    	float4(45.5, 0.0, 0.0, 0.0),
                    	float4(29.5, 0.0, 0.0, 0.0),
                    	float4(10.5, 0.0, 0.0, 0.0),
                    	float4(58.5, 0.0, 0.0, 0.0),
                    	float4(6.5, 0.0, 0.0, 0.0),
                    	float4(54.5, 0.0, 0.0, 0.0),
                    	float4(9.5, 0.0, 0.0, 0.0),
                    	float4(57.5, 0.0, 0.0, 0.0),
                    	float4(5.5, 0.0, 0.0, 0.0),
                    	float4(53.5, 0.0, 0.0, 0.0),
                    	float4(42.5, 0.0, 0.0, 0.0),
                    	float4(26.5, 0.0, 0.0, 0.0),
                    	float4(38.5, 0.0, 0.0, 0.0),
                    	float4(22.5, 0.0, 0.0, 0.0),
                    	float4(41.5, 0.0, 0.0, 0.0),
                    	float4(25.5, 0.0, 0.0, 0.0),
                    	float4(37.5, 0.0, 0.0, 0.0),
                    	float4(21.5, 0.0, 0.0, 0.0)
                    };
                    #ifndef XLT_REMAP_O
                    	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
                    #endif
                    constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
                    struct FGlobals_Type
                    {
                        float4 _Time;
                        float3 _WorldSpaceCameraPos;
                        float4 _ScreenParams;
                        float2 _GlobalMipBias;
                        float4 unity_OrthoParams;
                        float4 hlslcc_mtx4x4unity_MatrixV[4];
                    };
                    
                    struct UnityPerMaterial_Type
                    {
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_FragmentIn
                    {
                        float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
                        float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
                        half3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    		template <typename UVecType> UVecType bitFieldInsert(const UVecType width, const UVecType offset, const UVecType src2, const UVecType src3)
                    		{
                    			UVecType bitmask = (((UVecType(1) << width)-1) << offset) & 0xffffffff;
                    			return ((src2 << offset) & bitmask) | (src3 & ~bitmask);
                    		}; 
                    fragment Mtl_FragmentOut xlatMtlMain(
                        constant FGlobals_Type& FGlobals [[ buffer(0) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(1) ]],
                        sampler sampler_BaseMap [[ sampler (0) ]],
                        sampler sampler_RimMaskMap [[ sampler (1) ]],
                        sampler sampler_BaseMapEnemy [[ sampler (2) ]],
                        sampler sampler_EffectMap [[ sampler (3) ]],
                        texture2d<half, access::sample > _BaseMap [[ texture(0) ]] ,
                        texture2d<half, access::sample > _RimMaskMap [[ texture(1) ]] ,
                        texture2d<half, access::sample > _BaseMapEnemy [[ texture(2) ]] ,
                        texture2d<half, access::sample > _EffectMap [[ texture(3) ]] ,
                        float4 mtl_FragCoord [[ position ]],
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        float4 hlslcc_FragCoord = float4(mtl_FragCoord.xyz, 1.0/mtl_FragCoord.w);
                        float4 u_xlat0;
                        half2 u_xlat16_0;
                        bool3 u_xlatb0;
                        float4 u_xlat1;
                        half4 u_xlat16_1;
                        int u_xlati1;
                        uint2 u_xlatu1;
                        bool u_xlatb1;
                        half4 u_xlat16_2;
                        half3 u_xlat16_3;
                        half2 u_xlat16_4;
                        half2 u_xlat16_5;
                        float u_xlat6;
                        half3 u_xlat16_6;
                        int u_xlati7;
                        bool u_xlatb7;
                        half u_xlat16_8;
                        half3 u_xlat16_9;
                        half2 u_xlat16_16;
                        half u_xlat16_20;
                        half u_xlat16_21;
                        u_xlatb0.xyz = (half3(UnityPerMaterial._EnableEnemy, UnityPerMaterial._EnableEffect, UnityPerMaterial._Surface)==half3(1.0, 1.0, 1.0));
                        if(u_xlatb0.x){
                            u_xlat16_1 = _BaseMapEnemy.sample(sampler_BaseMapEnemy, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColorEnemy.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        } else {
                            u_xlat16_1 = _BaseMap.sample(sampler_BaseMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColor.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        }
                        if(u_xlatb0.y){
                            u_xlat1.yz = fma(FGlobals._Time.yy, float2(half2(UnityPerMaterial._EffectSpeedU, UnityPerMaterial._EffectSpeedV)), input.TEXCOORD0.zw);
                            u_xlat1.w = input.TEXCOORD0.w;
                            u_xlat16_0.xy = _EffectMap.sample(sampler_EffectMap, u_xlat1.yw, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                            u_xlat16_21 = u_xlat16_0.y + half(-0.5);
                            u_xlat16_21 = dot(half2(u_xlat16_21), half2(UnityPerMaterial._EffectDistortionIntensity));
                            u_xlat1.x = float(u_xlat16_21) + input.TEXCOORD0.z;
                            u_xlat16_6.xz = _EffectMap.sample(sampler_EffectMap, u_xlat1.xz, bias(FGlobals._GlobalMipBias.xyxx.x)).yw;
                            u_xlat16_4.xy = u_xlat16_0.xx + u_xlat16_6.zx;
                            u_xlat16_4.xy = u_xlat16_4.xy + half2(-0.850000024, -0.699999988);
                            u_xlat16_4.xy = u_xlat16_4.xy * half2(20.0000191, 3.33333325);
                            u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0h, 1.0h);
                            u_xlat16_16.xy = fma(u_xlat16_4.xy, half2(-2.0, -2.0), half2(3.0, 3.0));
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_4.xy;
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_16.xy;
                            u_xlat16_21 = u_xlat16_4.y * u_xlat16_4.x;
                            u_xlat16_3.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
                            u_xlat16_2.xyz = fma(half3(u_xlat16_21), u_xlat16_3.xyz, u_xlat16_2.xyz);
                        }
                        u_xlat16_20 = u_xlat16_2.w * UnityPerMaterial._BaseColor.w;
                        u_xlatb0.x = FGlobals.unity_OrthoParams.w==0.0;
                        u_xlat1.xyz = (-input.TEXCOORD1.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
                        u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
                        u_xlat6 = rsqrt(u_xlat6);
                        u_xlat1.xyz = float3(u_xlat6) * u_xlat1.xyz;
                        u_xlat16_3.x = (u_xlatb0.x) ? half(u_xlat1.x) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z);
                        u_xlat16_3.y = (u_xlatb0.x) ? half(u_xlat1.y) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z);
                        u_xlat16_3.z = (u_xlatb0.x) ? half(u_xlat1.z) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z);
                        u_xlat0.x = dot(input.TEXCOORD2.xyz, input.TEXCOORD2.xyz);
                        u_xlat0.x = rsqrt(u_xlat0.x);
                        u_xlat0.xyw = u_xlat0.xxx * float3(input.TEXCOORD2.xyz);
                        u_xlat1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
                        u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
                        u_xlat1.x = rsqrt(u_xlat1.x);
                        u_xlat1.xyz = u_xlat1.xxx * float3(u_xlat16_3.xyz);
                        u_xlat16_5.xy = _RimMaskMap.sample(sampler_RimMaskMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                        u_xlat1.x = dot(u_xlat0.xyw, u_xlat1.xyz);
                        u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
                        u_xlat16_3.x = half((-u_xlat1.x) + 1.0);
                        u_xlat16_9.x = dot(UnityPerMaterial._RimVector.xyz, UnityPerMaterial._RimVector.xyz);
                        u_xlat16_9.x = rsqrt(u_xlat16_9.x);
                        u_xlat16_9.xyz = u_xlat16_9.xxx * UnityPerMaterial._RimVector.xyz;
                        u_xlat0.x = dot(u_xlat0.xyw, float3(u_xlat16_9.xyz));
                        u_xlat0.x = fma(u_xlat0.x, 0.5, 0.5);
                        u_xlat16_9.x = fma((-UnityPerMaterial._RimBoaderSmooth), half(0.5), half(0.5));
                        u_xlat16_3.z = fma(UnityPerMaterial._RimBoaderSmooth, half(0.5), half(0.5));
                        u_xlat16_21 = UnityPerMaterial._RimWidth + half(-0.5);
                        u_xlat16_3.x = half(fma(float(u_xlat16_3.x), u_xlat0.x, float(u_xlat16_21)));
                        u_xlat16_3.xz = (-u_xlat16_9.xx) + u_xlat16_3.xz;
                        u_xlat16_9.x = half(1.0) / u_xlat16_3.z;
                        u_xlat16_3.x = u_xlat16_9.x * u_xlat16_3.x;
                        u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0h, 1.0h);
                        u_xlat16_9.x = fma(u_xlat16_3.x, half(-2.0), half(3.0));
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
                        u_xlat16_9.x = (-u_xlat16_5.y) + half(1.0);
                        u_xlat16_3.x = max(u_xlat16_9.x, u_xlat16_3.x);
                        u_xlat16_9.xyz = UnityPerMaterial._BaseColor.xyz * UnityPerMaterial._RimColor.xyz;
                        u_xlat0.x = dot(UnityPerMaterial._BaseColor.xyz, half3(0.298999995, 0.587000012, 0.114));
                        u_xlat6 = fma((-u_xlat0.x), u_xlat0.x, u_xlat0.x);
                        u_xlat0.x = fma((-u_xlat6), (-float(UnityPerMaterial._RimBaseColorCurve)), u_xlat0.x);
                        u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
                        u_xlat0.x = u_xlat0.x * float(u_xlat16_3.x);
                        u_xlat1.xyz = float3(u_xlat16_5.xxx) * float3(u_xlat16_9.xyz);
                        u_xlat16_3.x = (-UnityPerMaterial._EnableEnemy) + half(1.0);
                        u_xlat1.xyz = u_xlat1.xyz * float3(u_xlat16_3.xxx);
                        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
                        u_xlat1.xyz = fma(float3(u_xlat16_2.xyz), float3(UnityPerMaterial._BaseColor.xyz), u_xlat1.xyz);
                        u_xlat16_2.xyz = (-UnityPerMaterial._SubColor.xyz) + half3(1.0, 1.0, 1.0);
                        u_xlat16_2.xyz = half3(fma(u_xlat0.xxx, float3(u_xlat16_2.xyz), float3(UnityPerMaterial._SubColor.xyz)));
                        u_xlat0.xyw = u_xlat1.xyz * float3(u_xlat16_2.xyz);
                        u_xlat1.xy = FGlobals._ScreenParams.zw + float2(-1.0, -1.0);
                        u_xlat1.xy = u_xlat1.xy * hlslcc_FragCoord.xy;
                        u_xlat1.xy = u_xlat1.xy * FGlobals._ScreenParams.xy;
                        u_xlatu1.xy = uint2(u_xlat1.xy);
                        u_xlati1 = int(bitFieldInsert(0x3u, 0x3u, u_xlatu1.x, 0x0u));
                        u_xlati1 = int(bitFieldInsert(0x3u, 0x0u, u_xlatu1.y, uint(u_xlati1)));
                        u_xlat1.x = fma((-ImmCB_0[u_xlati1].x), 0.015625, float(u_xlat16_20));
                        u_xlatb1 = u_xlat1.x<0.0;
                        if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard_fragment();}
                        u_xlatb1 = UnityPerMaterial._EnableDissolve==half(1.0);
                        u_xlati7 = int((UnityPerMaterial._DissolveAlpha>=u_xlat16_20) ? 0xFFFFFFFFu : uint(0));
                        u_xlat16_2.x = (u_xlati7 != 0) ? half(1.0) : half(0.0);
                        u_xlatb7 = u_xlati7==0x0;
                        u_xlatb7 = u_xlatb1 && u_xlatb7;
                        if(((int(u_xlatb7) * int(0xffffffffu)))!=0){discard_fragment();}
                        u_xlat16_8 = (u_xlatb0.z) ? u_xlat16_20 : half(1.0);
                        output.SV_Target0.w = (u_xlatb1) ? u_xlat16_2.x : u_xlat16_8;
                        output.SV_Target0.xyz = half3(u_xlat0.xyw);
                        return output;
                    }
                    "
                }
                SubProgram "metal " {
                    Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS_CASCADE" }
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    #ifndef XLT_REMAP_O
                    	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
                    #endif
                    constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
                    struct FGlobals_Type
                    {
                        float4 _Time;
                        float3 _WorldSpaceCameraPos;
                        float2 _GlobalMipBias;
                        float4 unity_OrthoParams;
                        float4 hlslcc_mtx4x4unity_MatrixV[4];
                    };
                    
                    struct UnityPerMaterial_Type
                    {
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_FragmentIn
                    {
                        float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
                        float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
                        half3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    fragment Mtl_FragmentOut xlatMtlMain(
                        constant FGlobals_Type& FGlobals [[ buffer(0) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(1) ]],
                        sampler sampler_BaseMap [[ sampler (0) ]],
                        sampler sampler_RimMaskMap [[ sampler (1) ]],
                        sampler sampler_BaseMapEnemy [[ sampler (2) ]],
                        sampler sampler_EffectMap [[ sampler (3) ]],
                        texture2d<half, access::sample > _BaseMap [[ texture(0) ]] ,
                        texture2d<half, access::sample > _RimMaskMap [[ texture(1) ]] ,
                        texture2d<half, access::sample > _BaseMapEnemy [[ texture(2) ]] ,
                        texture2d<half, access::sample > _EffectMap [[ texture(3) ]] ,
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        float4 u_xlat0;
                        half2 u_xlat16_0;
                        bool3 u_xlatb0;
                        float4 u_xlat1;
                        half4 u_xlat16_1;
                        bool u_xlatb1;
                        half4 u_xlat16_2;
                        half3 u_xlat16_3;
                        half2 u_xlat16_4;
                        half2 u_xlat16_5;
                        float u_xlat6;
                        half3 u_xlat16_6;
                        int u_xlati7;
                        bool u_xlatb7;
                        half u_xlat16_8;
                        half3 u_xlat16_9;
                        half2 u_xlat16_16;
                        half u_xlat16_20;
                        half u_xlat16_21;
                        u_xlatb0.xyz = (half3(UnityPerMaterial._EnableEnemy, UnityPerMaterial._EnableEffect, UnityPerMaterial._Surface)==half3(1.0, 1.0, 1.0));
                        if(u_xlatb0.x){
                            u_xlat16_1 = _BaseMapEnemy.sample(sampler_BaseMapEnemy, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColorEnemy.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        } else {
                            u_xlat16_1 = _BaseMap.sample(sampler_BaseMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColor.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        }
                        if(u_xlatb0.y){
                            u_xlat1.yz = fma(FGlobals._Time.yy, float2(half2(UnityPerMaterial._EffectSpeedU, UnityPerMaterial._EffectSpeedV)), input.TEXCOORD0.zw);
                            u_xlat1.w = input.TEXCOORD0.w;
                            u_xlat16_0.xy = _EffectMap.sample(sampler_EffectMap, u_xlat1.yw, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                            u_xlat16_21 = u_xlat16_0.y + half(-0.5);
                            u_xlat16_21 = dot(half2(u_xlat16_21), half2(UnityPerMaterial._EffectDistortionIntensity));
                            u_xlat1.x = float(u_xlat16_21) + input.TEXCOORD0.z;
                            u_xlat16_6.xz = _EffectMap.sample(sampler_EffectMap, u_xlat1.xz, bias(FGlobals._GlobalMipBias.xyxx.x)).yw;
                            u_xlat16_4.xy = u_xlat16_0.xx + u_xlat16_6.zx;
                            u_xlat16_4.xy = u_xlat16_4.xy + half2(-0.850000024, -0.699999988);
                            u_xlat16_4.xy = u_xlat16_4.xy * half2(20.0000191, 3.33333325);
                            u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0h, 1.0h);
                            u_xlat16_16.xy = fma(u_xlat16_4.xy, half2(-2.0, -2.0), half2(3.0, 3.0));
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_4.xy;
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_16.xy;
                            u_xlat16_21 = u_xlat16_4.y * u_xlat16_4.x;
                            u_xlat16_3.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
                            u_xlat16_2.xyz = fma(half3(u_xlat16_21), u_xlat16_3.xyz, u_xlat16_2.xyz);
                        }
                        u_xlat16_20 = u_xlat16_2.w * UnityPerMaterial._BaseColor.w;
                        u_xlatb0.x = FGlobals.unity_OrthoParams.w==0.0;
                        u_xlat1.xyz = (-input.TEXCOORD1.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
                        u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
                        u_xlat6 = rsqrt(u_xlat6);
                        u_xlat1.xyz = float3(u_xlat6) * u_xlat1.xyz;
                        u_xlat16_3.x = (u_xlatb0.x) ? half(u_xlat1.x) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z);
                        u_xlat16_3.y = (u_xlatb0.x) ? half(u_xlat1.y) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z);
                        u_xlat16_3.z = (u_xlatb0.x) ? half(u_xlat1.z) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z);
                        u_xlat0.x = dot(input.TEXCOORD2.xyz, input.TEXCOORD2.xyz);
                        u_xlat0.x = rsqrt(u_xlat0.x);
                        u_xlat0.xyw = u_xlat0.xxx * float3(input.TEXCOORD2.xyz);
                        u_xlat1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
                        u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
                        u_xlat1.x = rsqrt(u_xlat1.x);
                        u_xlat1.xyz = u_xlat1.xxx * float3(u_xlat16_3.xyz);
                        u_xlat16_5.xy = _RimMaskMap.sample(sampler_RimMaskMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                        u_xlat1.x = dot(u_xlat0.xyw, u_xlat1.xyz);
                        u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
                        u_xlat16_3.x = half((-u_xlat1.x) + 1.0);
                        u_xlat16_9.x = dot(UnityPerMaterial._RimVector.xyz, UnityPerMaterial._RimVector.xyz);
                        u_xlat16_9.x = rsqrt(u_xlat16_9.x);
                        u_xlat16_9.xyz = u_xlat16_9.xxx * UnityPerMaterial._RimVector.xyz;
                        u_xlat0.x = dot(u_xlat0.xyw, float3(u_xlat16_9.xyz));
                        u_xlat0.x = fma(u_xlat0.x, 0.5, 0.5);
                        u_xlat16_9.x = fma((-UnityPerMaterial._RimBoaderSmooth), half(0.5), half(0.5));
                        u_xlat16_3.z = fma(UnityPerMaterial._RimBoaderSmooth, half(0.5), half(0.5));
                        u_xlat16_21 = UnityPerMaterial._RimWidth + half(-0.5);
                        u_xlat16_3.x = half(fma(float(u_xlat16_3.x), u_xlat0.x, float(u_xlat16_21)));
                        u_xlat16_3.xz = (-u_xlat16_9.xx) + u_xlat16_3.xz;
                        u_xlat16_9.x = half(1.0) / u_xlat16_3.z;
                        u_xlat16_3.x = u_xlat16_9.x * u_xlat16_3.x;
                        u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0h, 1.0h);
                        u_xlat16_9.x = fma(u_xlat16_3.x, half(-2.0), half(3.0));
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
                        u_xlat16_9.x = (-u_xlat16_5.y) + half(1.0);
                        u_xlat16_3.x = max(u_xlat16_9.x, u_xlat16_3.x);
                        u_xlat16_9.xyz = UnityPerMaterial._BaseColor.xyz * UnityPerMaterial._RimColor.xyz;
                        u_xlat0.x = dot(UnityPerMaterial._BaseColor.xyz, half3(0.298999995, 0.587000012, 0.114));
                        u_xlat6 = fma((-u_xlat0.x), u_xlat0.x, u_xlat0.x);
                        u_xlat0.x = fma((-u_xlat6), (-float(UnityPerMaterial._RimBaseColorCurve)), u_xlat0.x);
                        u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
                        u_xlat0.x = u_xlat0.x * float(u_xlat16_3.x);
                        u_xlat1.xyz = float3(u_xlat16_5.xxx) * float3(u_xlat16_9.xyz);
                        u_xlat16_3.x = (-UnityPerMaterial._EnableEnemy) + half(1.0);
                        u_xlat1.xyz = u_xlat1.xyz * float3(u_xlat16_3.xxx);
                        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
                        u_xlat1.xyz = fma(float3(u_xlat16_2.xyz), float3(UnityPerMaterial._BaseColor.xyz), u_xlat1.xyz);
                        u_xlat16_2.xyz = (-UnityPerMaterial._SubColor.xyz) + half3(1.0, 1.0, 1.0);
                        u_xlat16_2.xyz = half3(fma(u_xlat0.xxx, float3(u_xlat16_2.xyz), float3(UnityPerMaterial._SubColor.xyz)));
                        u_xlat0.xyw = u_xlat1.xyz * float3(u_xlat16_2.xyz);
                        u_xlatb1 = UnityPerMaterial._EnableDissolve==half(1.0);
                        u_xlati7 = int((UnityPerMaterial._DissolveAlpha>=u_xlat16_20) ? 0xFFFFFFFFu : uint(0));
                        u_xlat16_2.x = (u_xlati7 != 0) ? half(1.0) : half(0.0);
                        u_xlatb7 = u_xlati7==0x0;
                        u_xlatb7 = u_xlatb1 && u_xlatb7;
                        if(((int(u_xlatb7) * int(0xffffffffu)))!=0){discard_fragment();}
                        u_xlat16_8 = (u_xlatb0.z) ? u_xlat16_20 : half(1.0);
                        output.SV_Target0.w = (u_xlatb1) ? u_xlat16_2.x : u_xlat16_8;
                        output.SV_Target0.xyz = half3(u_xlat0.xyw);
                        return output;
                    }
                    "
                }
                SubProgram "metal " {
                    Keywords { "_ADDITIONAL_LIGHTS" "_ENABLE_DITHER_BASECOLOR_ALPHA" "_LIGHT_COOKIES" "_MAIN_LIGHT_SHADOWS" "_SHADOWS_SOFT" }
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    constant float4 ImmCB_0[64] =
                    {
                    	float4(0.5, 0.0, 0.0, 0.0),
                    	float4(48.5, 0.0, 0.0, 0.0),
                    	float4(12.5, 0.0, 0.0, 0.0),
                    	float4(60.5, 0.0, 0.0, 0.0),
                    	float4(3.5, 0.0, 0.0, 0.0),
                    	float4(51.5, 0.0, 0.0, 0.0),
                    	float4(15.5, 0.0, 0.0, 0.0),
                    	float4(63.5, 0.0, 0.0, 0.0),
                    	float4(32.5, 0.0, 0.0, 0.0),
                    	float4(16.5, 0.0, 0.0, 0.0),
                    	float4(44.5, 0.0, 0.0, 0.0),
                    	float4(28.5, 0.0, 0.0, 0.0),
                    	float4(35.5, 0.0, 0.0, 0.0),
                    	float4(19.5, 0.0, 0.0, 0.0),
                    	float4(47.5, 0.0, 0.0, 0.0),
                    	float4(31.5, 0.0, 0.0, 0.0),
                    	float4(8.5, 0.0, 0.0, 0.0),
                    	float4(56.5, 0.0, 0.0, 0.0),
                    	float4(4.5, 0.0, 0.0, 0.0),
                    	float4(52.5, 0.0, 0.0, 0.0),
                    	float4(11.5, 0.0, 0.0, 0.0),
                    	float4(59.5, 0.0, 0.0, 0.0),
                    	float4(7.5, 0.0, 0.0, 0.0),
                    	float4(55.5, 0.0, 0.0, 0.0),
                    	float4(40.5, 0.0, 0.0, 0.0),
                    	float4(24.5, 0.0, 0.0, 0.0),
                    	float4(36.5, 0.0, 0.0, 0.0),
                    	float4(20.5, 0.0, 0.0, 0.0),
                    	float4(43.5, 0.0, 0.0, 0.0),
                    	float4(27.5, 0.0, 0.0, 0.0),
                    	float4(39.5, 0.0, 0.0, 0.0),
                    	float4(23.5, 0.0, 0.0, 0.0),
                    	float4(2.5, 0.0, 0.0, 0.0),
                    	float4(50.5, 0.0, 0.0, 0.0),
                    	float4(14.5, 0.0, 0.0, 0.0),
                    	float4(62.5, 0.0, 0.0, 0.0),
                    	float4(1.5, 0.0, 0.0, 0.0),
                    	float4(49.5, 0.0, 0.0, 0.0),
                    	float4(13.5, 0.0, 0.0, 0.0),
                    	float4(61.5, 0.0, 0.0, 0.0),
                    	float4(34.5, 0.0, 0.0, 0.0),
                    	float4(18.5, 0.0, 0.0, 0.0),
                    	float4(46.5, 0.0, 0.0, 0.0),
                    	float4(30.5, 0.0, 0.0, 0.0),
                    	float4(33.5, 0.0, 0.0, 0.0),
                    	float4(17.5, 0.0, 0.0, 0.0),
                    	float4(45.5, 0.0, 0.0, 0.0),
                    	float4(29.5, 0.0, 0.0, 0.0),
                    	float4(10.5, 0.0, 0.0, 0.0),
                    	float4(58.5, 0.0, 0.0, 0.0),
                    	float4(6.5, 0.0, 0.0, 0.0),
                    	float4(54.5, 0.0, 0.0, 0.0),
                    	float4(9.5, 0.0, 0.0, 0.0),
                    	float4(57.5, 0.0, 0.0, 0.0),
                    	float4(5.5, 0.0, 0.0, 0.0),
                    	float4(53.5, 0.0, 0.0, 0.0),
                    	float4(42.5, 0.0, 0.0, 0.0),
                    	float4(26.5, 0.0, 0.0, 0.0),
                    	float4(38.5, 0.0, 0.0, 0.0),
                    	float4(22.5, 0.0, 0.0, 0.0),
                    	float4(41.5, 0.0, 0.0, 0.0),
                    	float4(25.5, 0.0, 0.0, 0.0),
                    	float4(37.5, 0.0, 0.0, 0.0),
                    	float4(21.5, 0.0, 0.0, 0.0)
                    };
                    #ifndef XLT_REMAP_O
                    	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
                    #endif
                    constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
                    struct FGlobals_Type
                    {
                        float4 _Time;
                        float3 _WorldSpaceCameraPos;
                        float4 _ScreenParams;
                        float2 _GlobalMipBias;
                        float4 unity_OrthoParams;
                        float4 hlslcc_mtx4x4unity_MatrixV[4];
                    };
                    
                    struct UnityPerMaterial_Type
                    {
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_FragmentIn
                    {
                        float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
                        float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
                        half3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    		template <typename UVecType> UVecType bitFieldInsert(const UVecType width, const UVecType offset, const UVecType src2, const UVecType src3)
                    		{
                    			UVecType bitmask = (((UVecType(1) << width)-1) << offset) & 0xffffffff;
                    			return ((src2 << offset) & bitmask) | (src3 & ~bitmask);
                    		}; 
                    fragment Mtl_FragmentOut xlatMtlMain(
                        constant FGlobals_Type& FGlobals [[ buffer(0) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(1) ]],
                        sampler sampler_BaseMap [[ sampler (0) ]],
                        sampler sampler_RimMaskMap [[ sampler (1) ]],
                        sampler sampler_BaseMapEnemy [[ sampler (2) ]],
                        sampler sampler_EffectMap [[ sampler (3) ]],
                        texture2d<half, access::sample > _BaseMap [[ texture(0) ]] ,
                        texture2d<half, access::sample > _RimMaskMap [[ texture(1) ]] ,
                        texture2d<half, access::sample > _BaseMapEnemy [[ texture(2) ]] ,
                        texture2d<half, access::sample > _EffectMap [[ texture(3) ]] ,
                        float4 mtl_FragCoord [[ position ]],
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        float4 hlslcc_FragCoord = float4(mtl_FragCoord.xyz, 1.0/mtl_FragCoord.w);
                        float4 u_xlat0;
                        half2 u_xlat16_0;
                        bool3 u_xlatb0;
                        float4 u_xlat1;
                        half4 u_xlat16_1;
                        int u_xlati1;
                        uint2 u_xlatu1;
                        bool u_xlatb1;
                        half4 u_xlat16_2;
                        half3 u_xlat16_3;
                        half2 u_xlat16_4;
                        half2 u_xlat16_5;
                        float u_xlat6;
                        half3 u_xlat16_6;
                        int u_xlati7;
                        bool u_xlatb7;
                        half u_xlat16_8;
                        half3 u_xlat16_9;
                        half2 u_xlat16_16;
                        half u_xlat16_20;
                        half u_xlat16_21;
                        u_xlatb0.xyz = (half3(UnityPerMaterial._EnableEnemy, UnityPerMaterial._EnableEffect, UnityPerMaterial._Surface)==half3(1.0, 1.0, 1.0));
                        if(u_xlatb0.x){
                            u_xlat16_1 = _BaseMapEnemy.sample(sampler_BaseMapEnemy, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColorEnemy.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        } else {
                            u_xlat16_1 = _BaseMap.sample(sampler_BaseMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColor.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        }
                        if(u_xlatb0.y){
                            u_xlat1.yz = fma(FGlobals._Time.yy, float2(half2(UnityPerMaterial._EffectSpeedU, UnityPerMaterial._EffectSpeedV)), input.TEXCOORD0.zw);
                            u_xlat1.w = input.TEXCOORD0.w;
                            u_xlat16_0.xy = _EffectMap.sample(sampler_EffectMap, u_xlat1.yw, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                            u_xlat16_21 = u_xlat16_0.y + half(-0.5);
                            u_xlat16_21 = dot(half2(u_xlat16_21), half2(UnityPerMaterial._EffectDistortionIntensity));
                            u_xlat1.x = float(u_xlat16_21) + input.TEXCOORD0.z;
                            u_xlat16_6.xz = _EffectMap.sample(sampler_EffectMap, u_xlat1.xz, bias(FGlobals._GlobalMipBias.xyxx.x)).yw;
                            u_xlat16_4.xy = u_xlat16_0.xx + u_xlat16_6.zx;
                            u_xlat16_4.xy = u_xlat16_4.xy + half2(-0.850000024, -0.699999988);
                            u_xlat16_4.xy = u_xlat16_4.xy * half2(20.0000191, 3.33333325);
                            u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0h, 1.0h);
                            u_xlat16_16.xy = fma(u_xlat16_4.xy, half2(-2.0, -2.0), half2(3.0, 3.0));
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_4.xy;
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_16.xy;
                            u_xlat16_21 = u_xlat16_4.y * u_xlat16_4.x;
                            u_xlat16_3.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
                            u_xlat16_2.xyz = fma(half3(u_xlat16_21), u_xlat16_3.xyz, u_xlat16_2.xyz);
                        }
                        u_xlat16_20 = u_xlat16_2.w * UnityPerMaterial._BaseColor.w;
                        u_xlatb0.x = FGlobals.unity_OrthoParams.w==0.0;
                        u_xlat1.xyz = (-input.TEXCOORD1.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
                        u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
                        u_xlat6 = rsqrt(u_xlat6);
                        u_xlat1.xyz = float3(u_xlat6) * u_xlat1.xyz;
                        u_xlat16_3.x = (u_xlatb0.x) ? half(u_xlat1.x) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z);
                        u_xlat16_3.y = (u_xlatb0.x) ? half(u_xlat1.y) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z);
                        u_xlat16_3.z = (u_xlatb0.x) ? half(u_xlat1.z) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z);
                        u_xlat0.x = dot(input.TEXCOORD2.xyz, input.TEXCOORD2.xyz);
                        u_xlat0.x = rsqrt(u_xlat0.x);
                        u_xlat0.xyw = u_xlat0.xxx * float3(input.TEXCOORD2.xyz);
                        u_xlat1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
                        u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
                        u_xlat1.x = rsqrt(u_xlat1.x);
                        u_xlat1.xyz = u_xlat1.xxx * float3(u_xlat16_3.xyz);
                        u_xlat16_5.xy = _RimMaskMap.sample(sampler_RimMaskMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                        u_xlat1.x = dot(u_xlat0.xyw, u_xlat1.xyz);
                        u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
                        u_xlat16_3.x = half((-u_xlat1.x) + 1.0);
                        u_xlat16_9.x = dot(UnityPerMaterial._RimVector.xyz, UnityPerMaterial._RimVector.xyz);
                        u_xlat16_9.x = rsqrt(u_xlat16_9.x);
                        u_xlat16_9.xyz = u_xlat16_9.xxx * UnityPerMaterial._RimVector.xyz;
                        u_xlat0.x = dot(u_xlat0.xyw, float3(u_xlat16_9.xyz));
                        u_xlat0.x = fma(u_xlat0.x, 0.5, 0.5);
                        u_xlat16_9.x = fma((-UnityPerMaterial._RimBoaderSmooth), half(0.5), half(0.5));
                        u_xlat16_3.z = fma(UnityPerMaterial._RimBoaderSmooth, half(0.5), half(0.5));
                        u_xlat16_21 = UnityPerMaterial._RimWidth + half(-0.5);
                        u_xlat16_3.x = half(fma(float(u_xlat16_3.x), u_xlat0.x, float(u_xlat16_21)));
                        u_xlat16_3.xz = (-u_xlat16_9.xx) + u_xlat16_3.xz;
                        u_xlat16_9.x = half(1.0) / u_xlat16_3.z;
                        u_xlat16_3.x = u_xlat16_9.x * u_xlat16_3.x;
                        u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0h, 1.0h);
                        u_xlat16_9.x = fma(u_xlat16_3.x, half(-2.0), half(3.0));
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
                        u_xlat16_9.x = (-u_xlat16_5.y) + half(1.0);
                        u_xlat16_3.x = max(u_xlat16_9.x, u_xlat16_3.x);
                        u_xlat16_9.xyz = UnityPerMaterial._BaseColor.xyz * UnityPerMaterial._RimColor.xyz;
                        u_xlat0.x = dot(UnityPerMaterial._BaseColor.xyz, half3(0.298999995, 0.587000012, 0.114));
                        u_xlat6 = fma((-u_xlat0.x), u_xlat0.x, u_xlat0.x);
                        u_xlat0.x = fma((-u_xlat6), (-float(UnityPerMaterial._RimBaseColorCurve)), u_xlat0.x);
                        u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
                        u_xlat0.x = u_xlat0.x * float(u_xlat16_3.x);
                        u_xlat1.xyz = float3(u_xlat16_5.xxx) * float3(u_xlat16_9.xyz);
                        u_xlat16_3.x = (-UnityPerMaterial._EnableEnemy) + half(1.0);
                        u_xlat1.xyz = u_xlat1.xyz * float3(u_xlat16_3.xxx);
                        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
                        u_xlat1.xyz = fma(float3(u_xlat16_2.xyz), float3(UnityPerMaterial._BaseColor.xyz), u_xlat1.xyz);
                        u_xlat16_2.xyz = (-UnityPerMaterial._SubColor.xyz) + half3(1.0, 1.0, 1.0);
                        u_xlat16_2.xyz = half3(fma(u_xlat0.xxx, float3(u_xlat16_2.xyz), float3(UnityPerMaterial._SubColor.xyz)));
                        u_xlat0.xyw = u_xlat1.xyz * float3(u_xlat16_2.xyz);
                        u_xlat1.xy = FGlobals._ScreenParams.zw + float2(-1.0, -1.0);
                        u_xlat1.xy = u_xlat1.xy * hlslcc_FragCoord.xy;
                        u_xlat1.xy = u_xlat1.xy * FGlobals._ScreenParams.xy;
                        u_xlatu1.xy = uint2(u_xlat1.xy);
                        u_xlati1 = int(bitFieldInsert(0x3u, 0x3u, u_xlatu1.x, 0x0u));
                        u_xlati1 = int(bitFieldInsert(0x3u, 0x0u, u_xlatu1.y, uint(u_xlati1)));
                        u_xlat1.x = fma((-ImmCB_0[u_xlati1].x), 0.015625, float(u_xlat16_20));
                        u_xlatb1 = u_xlat1.x<0.0;
                        if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard_fragment();}
                        u_xlatb1 = UnityPerMaterial._EnableDissolve==half(1.0);
                        u_xlati7 = int((UnityPerMaterial._DissolveAlpha>=u_xlat16_20) ? 0xFFFFFFFFu : uint(0));
                        u_xlat16_2.x = (u_xlati7 != 0) ? half(1.0) : half(0.0);
                        u_xlatb7 = u_xlati7==0x0;
                        u_xlatb7 = u_xlatb1 && u_xlatb7;
                        if(((int(u_xlatb7) * int(0xffffffffu)))!=0){discard_fragment();}
                        u_xlat16_8 = (u_xlatb0.z) ? u_xlat16_20 : half(1.0);
                        output.SV_Target0.w = (u_xlatb1) ? u_xlat16_2.x : u_xlat16_8;
                        output.SV_Target0.xyz = half3(u_xlat0.xyw);
                        return output;
                    }
                    "
                }
                SubProgram "metal " {
                    Keywords { "_ADDITIONAL_LIGHTS" "_LIGHT_COOKIES" "_MAIN_LIGHT_SHADOWS" "_SHADOWS_SOFT" }
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    #ifndef XLT_REMAP_O
                    	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
                    #endif
                    constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
                    struct FGlobals_Type
                    {
                        float4 _Time;
                        float3 _WorldSpaceCameraPos;
                        float2 _GlobalMipBias;
                        float4 unity_OrthoParams;
                        float4 hlslcc_mtx4x4unity_MatrixV[4];
                    };
                    
                    struct UnityPerMaterial_Type
                    {
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_FragmentIn
                    {
                        float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
                        float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
                        half3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    fragment Mtl_FragmentOut xlatMtlMain(
                        constant FGlobals_Type& FGlobals [[ buffer(0) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(1) ]],
                        sampler sampler_BaseMap [[ sampler (0) ]],
                        sampler sampler_RimMaskMap [[ sampler (1) ]],
                        sampler sampler_BaseMapEnemy [[ sampler (2) ]],
                        sampler sampler_EffectMap [[ sampler (3) ]],
                        texture2d<half, access::sample > _BaseMap [[ texture(0) ]] ,
                        texture2d<half, access::sample > _RimMaskMap [[ texture(1) ]] ,
                        texture2d<half, access::sample > _BaseMapEnemy [[ texture(2) ]] ,
                        texture2d<half, access::sample > _EffectMap [[ texture(3) ]] ,
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        float4 u_xlat0;
                        half2 u_xlat16_0;
                        bool3 u_xlatb0;
                        float4 u_xlat1;
                        half4 u_xlat16_1;
                        bool u_xlatb1;
                        half4 u_xlat16_2;
                        half3 u_xlat16_3;
                        half2 u_xlat16_4;
                        half2 u_xlat16_5;
                        float u_xlat6;
                        half3 u_xlat16_6;
                        int u_xlati7;
                        bool u_xlatb7;
                        half u_xlat16_8;
                        half3 u_xlat16_9;
                        half2 u_xlat16_16;
                        half u_xlat16_20;
                        half u_xlat16_21;
                        u_xlatb0.xyz = (half3(UnityPerMaterial._EnableEnemy, UnityPerMaterial._EnableEffect, UnityPerMaterial._Surface)==half3(1.0, 1.0, 1.0));
                        if(u_xlatb0.x){
                            u_xlat16_1 = _BaseMapEnemy.sample(sampler_BaseMapEnemy, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColorEnemy.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        } else {
                            u_xlat16_1 = _BaseMap.sample(sampler_BaseMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColor.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        }
                        if(u_xlatb0.y){
                            u_xlat1.yz = fma(FGlobals._Time.yy, float2(half2(UnityPerMaterial._EffectSpeedU, UnityPerMaterial._EffectSpeedV)), input.TEXCOORD0.zw);
                            u_xlat1.w = input.TEXCOORD0.w;
                            u_xlat16_0.xy = _EffectMap.sample(sampler_EffectMap, u_xlat1.yw, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                            u_xlat16_21 = u_xlat16_0.y + half(-0.5);
                            u_xlat16_21 = dot(half2(u_xlat16_21), half2(UnityPerMaterial._EffectDistortionIntensity));
                            u_xlat1.x = float(u_xlat16_21) + input.TEXCOORD0.z;
                            u_xlat16_6.xz = _EffectMap.sample(sampler_EffectMap, u_xlat1.xz, bias(FGlobals._GlobalMipBias.xyxx.x)).yw;
                            u_xlat16_4.xy = u_xlat16_0.xx + u_xlat16_6.zx;
                            u_xlat16_4.xy = u_xlat16_4.xy + half2(-0.850000024, -0.699999988);
                            u_xlat16_4.xy = u_xlat16_4.xy * half2(20.0000191, 3.33333325);
                            u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0h, 1.0h);
                            u_xlat16_16.xy = fma(u_xlat16_4.xy, half2(-2.0, -2.0), half2(3.0, 3.0));
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_4.xy;
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_16.xy;
                            u_xlat16_21 = u_xlat16_4.y * u_xlat16_4.x;
                            u_xlat16_3.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
                            u_xlat16_2.xyz = fma(half3(u_xlat16_21), u_xlat16_3.xyz, u_xlat16_2.xyz);
                        }
                        u_xlat16_20 = u_xlat16_2.w * UnityPerMaterial._BaseColor.w;
                        u_xlatb0.x = FGlobals.unity_OrthoParams.w==0.0;
                        u_xlat1.xyz = (-input.TEXCOORD1.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
                        u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
                        u_xlat6 = rsqrt(u_xlat6);
                        u_xlat1.xyz = float3(u_xlat6) * u_xlat1.xyz;
                        u_xlat16_3.x = (u_xlatb0.x) ? half(u_xlat1.x) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z);
                        u_xlat16_3.y = (u_xlatb0.x) ? half(u_xlat1.y) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z);
                        u_xlat16_3.z = (u_xlatb0.x) ? half(u_xlat1.z) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z);
                        u_xlat0.x = dot(input.TEXCOORD2.xyz, input.TEXCOORD2.xyz);
                        u_xlat0.x = rsqrt(u_xlat0.x);
                        u_xlat0.xyw = u_xlat0.xxx * float3(input.TEXCOORD2.xyz);
                        u_xlat1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
                        u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
                        u_xlat1.x = rsqrt(u_xlat1.x);
                        u_xlat1.xyz = u_xlat1.xxx * float3(u_xlat16_3.xyz);
                        u_xlat16_5.xy = _RimMaskMap.sample(sampler_RimMaskMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                        u_xlat1.x = dot(u_xlat0.xyw, u_xlat1.xyz);
                        u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
                        u_xlat16_3.x = half((-u_xlat1.x) + 1.0);
                        u_xlat16_9.x = dot(UnityPerMaterial._RimVector.xyz, UnityPerMaterial._RimVector.xyz);
                        u_xlat16_9.x = rsqrt(u_xlat16_9.x);
                        u_xlat16_9.xyz = u_xlat16_9.xxx * UnityPerMaterial._RimVector.xyz;
                        u_xlat0.x = dot(u_xlat0.xyw, float3(u_xlat16_9.xyz));
                        u_xlat0.x = fma(u_xlat0.x, 0.5, 0.5);
                        u_xlat16_9.x = fma((-UnityPerMaterial._RimBoaderSmooth), half(0.5), half(0.5));
                        u_xlat16_3.z = fma(UnityPerMaterial._RimBoaderSmooth, half(0.5), half(0.5));
                        u_xlat16_21 = UnityPerMaterial._RimWidth + half(-0.5);
                        u_xlat16_3.x = half(fma(float(u_xlat16_3.x), u_xlat0.x, float(u_xlat16_21)));
                        u_xlat16_3.xz = (-u_xlat16_9.xx) + u_xlat16_3.xz;
                        u_xlat16_9.x = half(1.0) / u_xlat16_3.z;
                        u_xlat16_3.x = u_xlat16_9.x * u_xlat16_3.x;
                        u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0h, 1.0h);
                        u_xlat16_9.x = fma(u_xlat16_3.x, half(-2.0), half(3.0));
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
                        u_xlat16_9.x = (-u_xlat16_5.y) + half(1.0);
                        u_xlat16_3.x = max(u_xlat16_9.x, u_xlat16_3.x);
                        u_xlat16_9.xyz = UnityPerMaterial._BaseColor.xyz * UnityPerMaterial._RimColor.xyz;
                        u_xlat0.x = dot(UnityPerMaterial._BaseColor.xyz, half3(0.298999995, 0.587000012, 0.114));
                        u_xlat6 = fma((-u_xlat0.x), u_xlat0.x, u_xlat0.x);
                        u_xlat0.x = fma((-u_xlat6), (-float(UnityPerMaterial._RimBaseColorCurve)), u_xlat0.x);
                        u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
                        u_xlat0.x = u_xlat0.x * float(u_xlat16_3.x);
                        u_xlat1.xyz = float3(u_xlat16_5.xxx) * float3(u_xlat16_9.xyz);
                        u_xlat16_3.x = (-UnityPerMaterial._EnableEnemy) + half(1.0);
                        u_xlat1.xyz = u_xlat1.xyz * float3(u_xlat16_3.xxx);
                        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
                        u_xlat1.xyz = fma(float3(u_xlat16_2.xyz), float3(UnityPerMaterial._BaseColor.xyz), u_xlat1.xyz);
                        u_xlat16_2.xyz = (-UnityPerMaterial._SubColor.xyz) + half3(1.0, 1.0, 1.0);
                        u_xlat16_2.xyz = half3(fma(u_xlat0.xxx, float3(u_xlat16_2.xyz), float3(UnityPerMaterial._SubColor.xyz)));
                        u_xlat0.xyw = u_xlat1.xyz * float3(u_xlat16_2.xyz);
                        u_xlatb1 = UnityPerMaterial._EnableDissolve==half(1.0);
                        u_xlati7 = int((UnityPerMaterial._DissolveAlpha>=u_xlat16_20) ? 0xFFFFFFFFu : uint(0));
                        u_xlat16_2.x = (u_xlati7 != 0) ? half(1.0) : half(0.0);
                        u_xlatb7 = u_xlati7==0x0;
                        u_xlatb7 = u_xlatb1 && u_xlatb7;
                        if(((int(u_xlatb7) * int(0xffffffffu)))!=0){discard_fragment();}
                        u_xlat16_8 = (u_xlatb0.z) ? u_xlat16_20 : half(1.0);
                        output.SV_Target0.w = (u_xlatb1) ? u_xlat16_2.x : u_xlat16_8;
                        output.SV_Target0.xyz = half3(u_xlat0.xyw);
                        return output;
                    }
                    "
                }
                SubProgram "metal " {
                    Keywords { "_ADDITIONAL_LIGHTS" "_ENABLE_DITHER_BASECOLOR_ALPHA" "_MAIN_LIGHT_SHADOWS" "_SHADOWS_SOFT" }
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    constant float4 ImmCB_0[64] =
                    {
                    	float4(0.5, 0.0, 0.0, 0.0),
                    	float4(48.5, 0.0, 0.0, 0.0),
                    	float4(12.5, 0.0, 0.0, 0.0),
                    	float4(60.5, 0.0, 0.0, 0.0),
                    	float4(3.5, 0.0, 0.0, 0.0),
                    	float4(51.5, 0.0, 0.0, 0.0),
                    	float4(15.5, 0.0, 0.0, 0.0),
                    	float4(63.5, 0.0, 0.0, 0.0),
                    	float4(32.5, 0.0, 0.0, 0.0),
                    	float4(16.5, 0.0, 0.0, 0.0),
                    	float4(44.5, 0.0, 0.0, 0.0),
                    	float4(28.5, 0.0, 0.0, 0.0),
                    	float4(35.5, 0.0, 0.0, 0.0),
                    	float4(19.5, 0.0, 0.0, 0.0),
                    	float4(47.5, 0.0, 0.0, 0.0),
                    	float4(31.5, 0.0, 0.0, 0.0),
                    	float4(8.5, 0.0, 0.0, 0.0),
                    	float4(56.5, 0.0, 0.0, 0.0),
                    	float4(4.5, 0.0, 0.0, 0.0),
                    	float4(52.5, 0.0, 0.0, 0.0),
                    	float4(11.5, 0.0, 0.0, 0.0),
                    	float4(59.5, 0.0, 0.0, 0.0),
                    	float4(7.5, 0.0, 0.0, 0.0),
                    	float4(55.5, 0.0, 0.0, 0.0),
                    	float4(40.5, 0.0, 0.0, 0.0),
                    	float4(24.5, 0.0, 0.0, 0.0),
                    	float4(36.5, 0.0, 0.0, 0.0),
                    	float4(20.5, 0.0, 0.0, 0.0),
                    	float4(43.5, 0.0, 0.0, 0.0),
                    	float4(27.5, 0.0, 0.0, 0.0),
                    	float4(39.5, 0.0, 0.0, 0.0),
                    	float4(23.5, 0.0, 0.0, 0.0),
                    	float4(2.5, 0.0, 0.0, 0.0),
                    	float4(50.5, 0.0, 0.0, 0.0),
                    	float4(14.5, 0.0, 0.0, 0.0),
                    	float4(62.5, 0.0, 0.0, 0.0),
                    	float4(1.5, 0.0, 0.0, 0.0),
                    	float4(49.5, 0.0, 0.0, 0.0),
                    	float4(13.5, 0.0, 0.0, 0.0),
                    	float4(61.5, 0.0, 0.0, 0.0),
                    	float4(34.5, 0.0, 0.0, 0.0),
                    	float4(18.5, 0.0, 0.0, 0.0),
                    	float4(46.5, 0.0, 0.0, 0.0),
                    	float4(30.5, 0.0, 0.0, 0.0),
                    	float4(33.5, 0.0, 0.0, 0.0),
                    	float4(17.5, 0.0, 0.0, 0.0),
                    	float4(45.5, 0.0, 0.0, 0.0),
                    	float4(29.5, 0.0, 0.0, 0.0),
                    	float4(10.5, 0.0, 0.0, 0.0),
                    	float4(58.5, 0.0, 0.0, 0.0),
                    	float4(6.5, 0.0, 0.0, 0.0),
                    	float4(54.5, 0.0, 0.0, 0.0),
                    	float4(9.5, 0.0, 0.0, 0.0),
                    	float4(57.5, 0.0, 0.0, 0.0),
                    	float4(5.5, 0.0, 0.0, 0.0),
                    	float4(53.5, 0.0, 0.0, 0.0),
                    	float4(42.5, 0.0, 0.0, 0.0),
                    	float4(26.5, 0.0, 0.0, 0.0),
                    	float4(38.5, 0.0, 0.0, 0.0),
                    	float4(22.5, 0.0, 0.0, 0.0),
                    	float4(41.5, 0.0, 0.0, 0.0),
                    	float4(25.5, 0.0, 0.0, 0.0),
                    	float4(37.5, 0.0, 0.0, 0.0),
                    	float4(21.5, 0.0, 0.0, 0.0)
                    };
                    #ifndef XLT_REMAP_O
                    	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
                    #endif
                    constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
                    struct FGlobals_Type
                    {
                        float4 _Time;
                        float3 _WorldSpaceCameraPos;
                        float4 _ScreenParams;
                        float2 _GlobalMipBias;
                        float4 unity_OrthoParams;
                        float4 hlslcc_mtx4x4unity_MatrixV[4];
                    };
                    
                    struct UnityPerMaterial_Type
                    {
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_FragmentIn
                    {
                        float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
                        float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
                        half3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    		template <typename UVecType> UVecType bitFieldInsert(const UVecType width, const UVecType offset, const UVecType src2, const UVecType src3)
                    		{
                    			UVecType bitmask = (((UVecType(1) << width)-1) << offset) & 0xffffffff;
                    			return ((src2 << offset) & bitmask) | (src3 & ~bitmask);
                    		}; 
                    fragment Mtl_FragmentOut xlatMtlMain(
                        constant FGlobals_Type& FGlobals [[ buffer(0) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(1) ]],
                        sampler sampler_BaseMap [[ sampler (0) ]],
                        sampler sampler_RimMaskMap [[ sampler (1) ]],
                        sampler sampler_BaseMapEnemy [[ sampler (2) ]],
                        sampler sampler_EffectMap [[ sampler (3) ]],
                        texture2d<half, access::sample > _BaseMap [[ texture(0) ]] ,
                        texture2d<half, access::sample > _RimMaskMap [[ texture(1) ]] ,
                        texture2d<half, access::sample > _BaseMapEnemy [[ texture(2) ]] ,
                        texture2d<half, access::sample > _EffectMap [[ texture(3) ]] ,
                        float4 mtl_FragCoord [[ position ]],
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        float4 hlslcc_FragCoord = float4(mtl_FragCoord.xyz, 1.0/mtl_FragCoord.w);
                        float4 u_xlat0;
                        half2 u_xlat16_0;
                        bool3 u_xlatb0;
                        float4 u_xlat1;
                        half4 u_xlat16_1;
                        int u_xlati1;
                        uint2 u_xlatu1;
                        bool u_xlatb1;
                        half4 u_xlat16_2;
                        half3 u_xlat16_3;
                        half2 u_xlat16_4;
                        half2 u_xlat16_5;
                        float u_xlat6;
                        half3 u_xlat16_6;
                        int u_xlati7;
                        bool u_xlatb7;
                        half u_xlat16_8;
                        half3 u_xlat16_9;
                        half2 u_xlat16_16;
                        half u_xlat16_20;
                        half u_xlat16_21;
                        u_xlatb0.xyz = (half3(UnityPerMaterial._EnableEnemy, UnityPerMaterial._EnableEffect, UnityPerMaterial._Surface)==half3(1.0, 1.0, 1.0));
                        if(u_xlatb0.x){
                            u_xlat16_1 = _BaseMapEnemy.sample(sampler_BaseMapEnemy, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColorEnemy.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        } else {
                            u_xlat16_1 = _BaseMap.sample(sampler_BaseMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColor.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        }
                        if(u_xlatb0.y){
                            u_xlat1.yz = fma(FGlobals._Time.yy, float2(half2(UnityPerMaterial._EffectSpeedU, UnityPerMaterial._EffectSpeedV)), input.TEXCOORD0.zw);
                            u_xlat1.w = input.TEXCOORD0.w;
                            u_xlat16_0.xy = _EffectMap.sample(sampler_EffectMap, u_xlat1.yw, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                            u_xlat16_21 = u_xlat16_0.y + half(-0.5);
                            u_xlat16_21 = dot(half2(u_xlat16_21), half2(UnityPerMaterial._EffectDistortionIntensity));
                            u_xlat1.x = float(u_xlat16_21) + input.TEXCOORD0.z;
                            u_xlat16_6.xz = _EffectMap.sample(sampler_EffectMap, u_xlat1.xz, bias(FGlobals._GlobalMipBias.xyxx.x)).yw;
                            u_xlat16_4.xy = u_xlat16_0.xx + u_xlat16_6.zx;
                            u_xlat16_4.xy = u_xlat16_4.xy + half2(-0.850000024, -0.699999988);
                            u_xlat16_4.xy = u_xlat16_4.xy * half2(20.0000191, 3.33333325);
                            u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0h, 1.0h);
                            u_xlat16_16.xy = fma(u_xlat16_4.xy, half2(-2.0, -2.0), half2(3.0, 3.0));
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_4.xy;
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_16.xy;
                            u_xlat16_21 = u_xlat16_4.y * u_xlat16_4.x;
                            u_xlat16_3.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
                            u_xlat16_2.xyz = fma(half3(u_xlat16_21), u_xlat16_3.xyz, u_xlat16_2.xyz);
                        }
                        u_xlat16_20 = u_xlat16_2.w * UnityPerMaterial._BaseColor.w;
                        u_xlatb0.x = FGlobals.unity_OrthoParams.w==0.0;
                        u_xlat1.xyz = (-input.TEXCOORD1.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
                        u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
                        u_xlat6 = rsqrt(u_xlat6);
                        u_xlat1.xyz = float3(u_xlat6) * u_xlat1.xyz;
                        u_xlat16_3.x = (u_xlatb0.x) ? half(u_xlat1.x) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z);
                        u_xlat16_3.y = (u_xlatb0.x) ? half(u_xlat1.y) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z);
                        u_xlat16_3.z = (u_xlatb0.x) ? half(u_xlat1.z) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z);
                        u_xlat0.x = dot(input.TEXCOORD2.xyz, input.TEXCOORD2.xyz);
                        u_xlat0.x = rsqrt(u_xlat0.x);
                        u_xlat0.xyw = u_xlat0.xxx * float3(input.TEXCOORD2.xyz);
                        u_xlat1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
                        u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
                        u_xlat1.x = rsqrt(u_xlat1.x);
                        u_xlat1.xyz = u_xlat1.xxx * float3(u_xlat16_3.xyz);
                        u_xlat16_5.xy = _RimMaskMap.sample(sampler_RimMaskMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                        u_xlat1.x = dot(u_xlat0.xyw, u_xlat1.xyz);
                        u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
                        u_xlat16_3.x = half((-u_xlat1.x) + 1.0);
                        u_xlat16_9.x = dot(UnityPerMaterial._RimVector.xyz, UnityPerMaterial._RimVector.xyz);
                        u_xlat16_9.x = rsqrt(u_xlat16_9.x);
                        u_xlat16_9.xyz = u_xlat16_9.xxx * UnityPerMaterial._RimVector.xyz;
                        u_xlat0.x = dot(u_xlat0.xyw, float3(u_xlat16_9.xyz));
                        u_xlat0.x = fma(u_xlat0.x, 0.5, 0.5);
                        u_xlat16_9.x = fma((-UnityPerMaterial._RimBoaderSmooth), half(0.5), half(0.5));
                        u_xlat16_3.z = fma(UnityPerMaterial._RimBoaderSmooth, half(0.5), half(0.5));
                        u_xlat16_21 = UnityPerMaterial._RimWidth + half(-0.5);
                        u_xlat16_3.x = half(fma(float(u_xlat16_3.x), u_xlat0.x, float(u_xlat16_21)));
                        u_xlat16_3.xz = (-u_xlat16_9.xx) + u_xlat16_3.xz;
                        u_xlat16_9.x = half(1.0) / u_xlat16_3.z;
                        u_xlat16_3.x = u_xlat16_9.x * u_xlat16_3.x;
                        u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0h, 1.0h);
                        u_xlat16_9.x = fma(u_xlat16_3.x, half(-2.0), half(3.0));
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
                        u_xlat16_9.x = (-u_xlat16_5.y) + half(1.0);
                        u_xlat16_3.x = max(u_xlat16_9.x, u_xlat16_3.x);
                        u_xlat16_9.xyz = UnityPerMaterial._BaseColor.xyz * UnityPerMaterial._RimColor.xyz;
                        u_xlat0.x = dot(UnityPerMaterial._BaseColor.xyz, half3(0.298999995, 0.587000012, 0.114));
                        u_xlat6 = fma((-u_xlat0.x), u_xlat0.x, u_xlat0.x);
                        u_xlat0.x = fma((-u_xlat6), (-float(UnityPerMaterial._RimBaseColorCurve)), u_xlat0.x);
                        u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
                        u_xlat0.x = u_xlat0.x * float(u_xlat16_3.x);
                        u_xlat1.xyz = float3(u_xlat16_5.xxx) * float3(u_xlat16_9.xyz);
                        u_xlat16_3.x = (-UnityPerMaterial._EnableEnemy) + half(1.0);
                        u_xlat1.xyz = u_xlat1.xyz * float3(u_xlat16_3.xxx);
                        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
                        u_xlat1.xyz = fma(float3(u_xlat16_2.xyz), float3(UnityPerMaterial._BaseColor.xyz), u_xlat1.xyz);
                        u_xlat16_2.xyz = (-UnityPerMaterial._SubColor.xyz) + half3(1.0, 1.0, 1.0);
                        u_xlat16_2.xyz = half3(fma(u_xlat0.xxx, float3(u_xlat16_2.xyz), float3(UnityPerMaterial._SubColor.xyz)));
                        u_xlat0.xyw = u_xlat1.xyz * float3(u_xlat16_2.xyz);
                        u_xlat1.xy = FGlobals._ScreenParams.zw + float2(-1.0, -1.0);
                        u_xlat1.xy = u_xlat1.xy * hlslcc_FragCoord.xy;
                        u_xlat1.xy = u_xlat1.xy * FGlobals._ScreenParams.xy;
                        u_xlatu1.xy = uint2(u_xlat1.xy);
                        u_xlati1 = int(bitFieldInsert(0x3u, 0x3u, u_xlatu1.x, 0x0u));
                        u_xlati1 = int(bitFieldInsert(0x3u, 0x0u, u_xlatu1.y, uint(u_xlati1)));
                        u_xlat1.x = fma((-ImmCB_0[u_xlati1].x), 0.015625, float(u_xlat16_20));
                        u_xlatb1 = u_xlat1.x<0.0;
                        if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard_fragment();}
                        u_xlatb1 = UnityPerMaterial._EnableDissolve==half(1.0);
                        u_xlati7 = int((UnityPerMaterial._DissolveAlpha>=u_xlat16_20) ? 0xFFFFFFFFu : uint(0));
                        u_xlat16_2.x = (u_xlati7 != 0) ? half(1.0) : half(0.0);
                        u_xlatb7 = u_xlati7==0x0;
                        u_xlatb7 = u_xlatb1 && u_xlatb7;
                        if(((int(u_xlatb7) * int(0xffffffffu)))!=0){discard_fragment();}
                        u_xlat16_8 = (u_xlatb0.z) ? u_xlat16_20 : half(1.0);
                        output.SV_Target0.w = (u_xlatb1) ? u_xlat16_2.x : u_xlat16_8;
                        output.SV_Target0.xyz = half3(u_xlat0.xyw);
                        return output;
                    }
                    "
                }
                SubProgram "metal " {
                    Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS" "_SHADOWS_SOFT" }
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    #ifndef XLT_REMAP_O
                    	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
                    #endif
                    constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
                    struct FGlobals_Type
                    {
                        float4 _Time;
                        float3 _WorldSpaceCameraPos;
                        float2 _GlobalMipBias;
                        float4 unity_OrthoParams;
                        float4 hlslcc_mtx4x4unity_MatrixV[4];
                    };
                    
                    struct UnityPerMaterial_Type
                    {
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_FragmentIn
                    {
                        float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
                        float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
                        half3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    fragment Mtl_FragmentOut xlatMtlMain(
                        constant FGlobals_Type& FGlobals [[ buffer(0) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(1) ]],
                        sampler sampler_BaseMap [[ sampler (0) ]],
                        sampler sampler_RimMaskMap [[ sampler (1) ]],
                        sampler sampler_BaseMapEnemy [[ sampler (2) ]],
                        sampler sampler_EffectMap [[ sampler (3) ]],
                        texture2d<half, access::sample > _BaseMap [[ texture(0) ]] ,
                        texture2d<half, access::sample > _RimMaskMap [[ texture(1) ]] ,
                        texture2d<half, access::sample > _BaseMapEnemy [[ texture(2) ]] ,
                        texture2d<half, access::sample > _EffectMap [[ texture(3) ]] ,
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        float4 u_xlat0;
                        half2 u_xlat16_0;
                        bool3 u_xlatb0;
                        float4 u_xlat1;
                        half4 u_xlat16_1;
                        bool u_xlatb1;
                        half4 u_xlat16_2;
                        half3 u_xlat16_3;
                        half2 u_xlat16_4;
                        half2 u_xlat16_5;
                        float u_xlat6;
                        half3 u_xlat16_6;
                        int u_xlati7;
                        bool u_xlatb7;
                        half u_xlat16_8;
                        half3 u_xlat16_9;
                        half2 u_xlat16_16;
                        half u_xlat16_20;
                        half u_xlat16_21;
                        u_xlatb0.xyz = (half3(UnityPerMaterial._EnableEnemy, UnityPerMaterial._EnableEffect, UnityPerMaterial._Surface)==half3(1.0, 1.0, 1.0));
                        if(u_xlatb0.x){
                            u_xlat16_1 = _BaseMapEnemy.sample(sampler_BaseMapEnemy, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColorEnemy.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        } else {
                            u_xlat16_1 = _BaseMap.sample(sampler_BaseMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColor.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        }
                        if(u_xlatb0.y){
                            u_xlat1.yz = fma(FGlobals._Time.yy, float2(half2(UnityPerMaterial._EffectSpeedU, UnityPerMaterial._EffectSpeedV)), input.TEXCOORD0.zw);
                            u_xlat1.w = input.TEXCOORD0.w;
                            u_xlat16_0.xy = _EffectMap.sample(sampler_EffectMap, u_xlat1.yw, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                            u_xlat16_21 = u_xlat16_0.y + half(-0.5);
                            u_xlat16_21 = dot(half2(u_xlat16_21), half2(UnityPerMaterial._EffectDistortionIntensity));
                            u_xlat1.x = float(u_xlat16_21) + input.TEXCOORD0.z;
                            u_xlat16_6.xz = _EffectMap.sample(sampler_EffectMap, u_xlat1.xz, bias(FGlobals._GlobalMipBias.xyxx.x)).yw;
                            u_xlat16_4.xy = u_xlat16_0.xx + u_xlat16_6.zx;
                            u_xlat16_4.xy = u_xlat16_4.xy + half2(-0.850000024, -0.699999988);
                            u_xlat16_4.xy = u_xlat16_4.xy * half2(20.0000191, 3.33333325);
                            u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0h, 1.0h);
                            u_xlat16_16.xy = fma(u_xlat16_4.xy, half2(-2.0, -2.0), half2(3.0, 3.0));
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_4.xy;
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_16.xy;
                            u_xlat16_21 = u_xlat16_4.y * u_xlat16_4.x;
                            u_xlat16_3.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
                            u_xlat16_2.xyz = fma(half3(u_xlat16_21), u_xlat16_3.xyz, u_xlat16_2.xyz);
                        }
                        u_xlat16_20 = u_xlat16_2.w * UnityPerMaterial._BaseColor.w;
                        u_xlatb0.x = FGlobals.unity_OrthoParams.w==0.0;
                        u_xlat1.xyz = (-input.TEXCOORD1.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
                        u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
                        u_xlat6 = rsqrt(u_xlat6);
                        u_xlat1.xyz = float3(u_xlat6) * u_xlat1.xyz;
                        u_xlat16_3.x = (u_xlatb0.x) ? half(u_xlat1.x) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z);
                        u_xlat16_3.y = (u_xlatb0.x) ? half(u_xlat1.y) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z);
                        u_xlat16_3.z = (u_xlatb0.x) ? half(u_xlat1.z) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z);
                        u_xlat0.x = dot(input.TEXCOORD2.xyz, input.TEXCOORD2.xyz);
                        u_xlat0.x = rsqrt(u_xlat0.x);
                        u_xlat0.xyw = u_xlat0.xxx * float3(input.TEXCOORD2.xyz);
                        u_xlat1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
                        u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
                        u_xlat1.x = rsqrt(u_xlat1.x);
                        u_xlat1.xyz = u_xlat1.xxx * float3(u_xlat16_3.xyz);
                        u_xlat16_5.xy = _RimMaskMap.sample(sampler_RimMaskMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                        u_xlat1.x = dot(u_xlat0.xyw, u_xlat1.xyz);
                        u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
                        u_xlat16_3.x = half((-u_xlat1.x) + 1.0);
                        u_xlat16_9.x = dot(UnityPerMaterial._RimVector.xyz, UnityPerMaterial._RimVector.xyz);
                        u_xlat16_9.x = rsqrt(u_xlat16_9.x);
                        u_xlat16_9.xyz = u_xlat16_9.xxx * UnityPerMaterial._RimVector.xyz;
                        u_xlat0.x = dot(u_xlat0.xyw, float3(u_xlat16_9.xyz));
                        u_xlat0.x = fma(u_xlat0.x, 0.5, 0.5);
                        u_xlat16_9.x = fma((-UnityPerMaterial._RimBoaderSmooth), half(0.5), half(0.5));
                        u_xlat16_3.z = fma(UnityPerMaterial._RimBoaderSmooth, half(0.5), half(0.5));
                        u_xlat16_21 = UnityPerMaterial._RimWidth + half(-0.5);
                        u_xlat16_3.x = half(fma(float(u_xlat16_3.x), u_xlat0.x, float(u_xlat16_21)));
                        u_xlat16_3.xz = (-u_xlat16_9.xx) + u_xlat16_3.xz;
                        u_xlat16_9.x = half(1.0) / u_xlat16_3.z;
                        u_xlat16_3.x = u_xlat16_9.x * u_xlat16_3.x;
                        u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0h, 1.0h);
                        u_xlat16_9.x = fma(u_xlat16_3.x, half(-2.0), half(3.0));
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
                        u_xlat16_9.x = (-u_xlat16_5.y) + half(1.0);
                        u_xlat16_3.x = max(u_xlat16_9.x, u_xlat16_3.x);
                        u_xlat16_9.xyz = UnityPerMaterial._BaseColor.xyz * UnityPerMaterial._RimColor.xyz;
                        u_xlat0.x = dot(UnityPerMaterial._BaseColor.xyz, half3(0.298999995, 0.587000012, 0.114));
                        u_xlat6 = fma((-u_xlat0.x), u_xlat0.x, u_xlat0.x);
                        u_xlat0.x = fma((-u_xlat6), (-float(UnityPerMaterial._RimBaseColorCurve)), u_xlat0.x);
                        u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
                        u_xlat0.x = u_xlat0.x * float(u_xlat16_3.x);
                        u_xlat1.xyz = float3(u_xlat16_5.xxx) * float3(u_xlat16_9.xyz);
                        u_xlat16_3.x = (-UnityPerMaterial._EnableEnemy) + half(1.0);
                        u_xlat1.xyz = u_xlat1.xyz * float3(u_xlat16_3.xxx);
                        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
                        u_xlat1.xyz = fma(float3(u_xlat16_2.xyz), float3(UnityPerMaterial._BaseColor.xyz), u_xlat1.xyz);
                        u_xlat16_2.xyz = (-UnityPerMaterial._SubColor.xyz) + half3(1.0, 1.0, 1.0);
                        u_xlat16_2.xyz = half3(fma(u_xlat0.xxx, float3(u_xlat16_2.xyz), float3(UnityPerMaterial._SubColor.xyz)));
                        u_xlat0.xyw = u_xlat1.xyz * float3(u_xlat16_2.xyz);
                        u_xlatb1 = UnityPerMaterial._EnableDissolve==half(1.0);
                        u_xlati7 = int((UnityPerMaterial._DissolveAlpha>=u_xlat16_20) ? 0xFFFFFFFFu : uint(0));
                        u_xlat16_2.x = (u_xlati7 != 0) ? half(1.0) : half(0.0);
                        u_xlatb7 = u_xlati7==0x0;
                        u_xlatb7 = u_xlatb1 && u_xlatb7;
                        if(((int(u_xlatb7) * int(0xffffffffu)))!=0){discard_fragment();}
                        u_xlat16_8 = (u_xlatb0.z) ? u_xlat16_20 : half(1.0);
                        output.SV_Target0.w = (u_xlatb1) ? u_xlat16_2.x : u_xlat16_8;
                        output.SV_Target0.xyz = half3(u_xlat0.xyw);
                        return output;
                    }
                    "
                }
                SubProgram "metal " {
                    Keywords { "_ADDITIONAL_LIGHTS" "_ENABLE_DITHER_BASECOLOR_ALPHA" "_LIGHT_COOKIES" "_MAIN_LIGHT_SHADOWS" }
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    constant float4 ImmCB_0[64] =
                    {
                    	float4(0.5, 0.0, 0.0, 0.0),
                    	float4(48.5, 0.0, 0.0, 0.0),
                    	float4(12.5, 0.0, 0.0, 0.0),
                    	float4(60.5, 0.0, 0.0, 0.0),
                    	float4(3.5, 0.0, 0.0, 0.0),
                    	float4(51.5, 0.0, 0.0, 0.0),
                    	float4(15.5, 0.0, 0.0, 0.0),
                    	float4(63.5, 0.0, 0.0, 0.0),
                    	float4(32.5, 0.0, 0.0, 0.0),
                    	float4(16.5, 0.0, 0.0, 0.0),
                    	float4(44.5, 0.0, 0.0, 0.0),
                    	float4(28.5, 0.0, 0.0, 0.0),
                    	float4(35.5, 0.0, 0.0, 0.0),
                    	float4(19.5, 0.0, 0.0, 0.0),
                    	float4(47.5, 0.0, 0.0, 0.0),
                    	float4(31.5, 0.0, 0.0, 0.0),
                    	float4(8.5, 0.0, 0.0, 0.0),
                    	float4(56.5, 0.0, 0.0, 0.0),
                    	float4(4.5, 0.0, 0.0, 0.0),
                    	float4(52.5, 0.0, 0.0, 0.0),
                    	float4(11.5, 0.0, 0.0, 0.0),
                    	float4(59.5, 0.0, 0.0, 0.0),
                    	float4(7.5, 0.0, 0.0, 0.0),
                    	float4(55.5, 0.0, 0.0, 0.0),
                    	float4(40.5, 0.0, 0.0, 0.0),
                    	float4(24.5, 0.0, 0.0, 0.0),
                    	float4(36.5, 0.0, 0.0, 0.0),
                    	float4(20.5, 0.0, 0.0, 0.0),
                    	float4(43.5, 0.0, 0.0, 0.0),
                    	float4(27.5, 0.0, 0.0, 0.0),
                    	float4(39.5, 0.0, 0.0, 0.0),
                    	float4(23.5, 0.0, 0.0, 0.0),
                    	float4(2.5, 0.0, 0.0, 0.0),
                    	float4(50.5, 0.0, 0.0, 0.0),
                    	float4(14.5, 0.0, 0.0, 0.0),
                    	float4(62.5, 0.0, 0.0, 0.0),
                    	float4(1.5, 0.0, 0.0, 0.0),
                    	float4(49.5, 0.0, 0.0, 0.0),
                    	float4(13.5, 0.0, 0.0, 0.0),
                    	float4(61.5, 0.0, 0.0, 0.0),
                    	float4(34.5, 0.0, 0.0, 0.0),
                    	float4(18.5, 0.0, 0.0, 0.0),
                    	float4(46.5, 0.0, 0.0, 0.0),
                    	float4(30.5, 0.0, 0.0, 0.0),
                    	float4(33.5, 0.0, 0.0, 0.0),
                    	float4(17.5, 0.0, 0.0, 0.0),
                    	float4(45.5, 0.0, 0.0, 0.0),
                    	float4(29.5, 0.0, 0.0, 0.0),
                    	float4(10.5, 0.0, 0.0, 0.0),
                    	float4(58.5, 0.0, 0.0, 0.0),
                    	float4(6.5, 0.0, 0.0, 0.0),
                    	float4(54.5, 0.0, 0.0, 0.0),
                    	float4(9.5, 0.0, 0.0, 0.0),
                    	float4(57.5, 0.0, 0.0, 0.0),
                    	float4(5.5, 0.0, 0.0, 0.0),
                    	float4(53.5, 0.0, 0.0, 0.0),
                    	float4(42.5, 0.0, 0.0, 0.0),
                    	float4(26.5, 0.0, 0.0, 0.0),
                    	float4(38.5, 0.0, 0.0, 0.0),
                    	float4(22.5, 0.0, 0.0, 0.0),
                    	float4(41.5, 0.0, 0.0, 0.0),
                    	float4(25.5, 0.0, 0.0, 0.0),
                    	float4(37.5, 0.0, 0.0, 0.0),
                    	float4(21.5, 0.0, 0.0, 0.0)
                    };
                    #ifndef XLT_REMAP_O
                    	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
                    #endif
                    constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
                    struct FGlobals_Type
                    {
                        float4 _Time;
                        float3 _WorldSpaceCameraPos;
                        float4 _ScreenParams;
                        float2 _GlobalMipBias;
                        float4 unity_OrthoParams;
                        float4 hlslcc_mtx4x4unity_MatrixV[4];
                    };
                    
                    struct UnityPerMaterial_Type
                    {
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_FragmentIn
                    {
                        float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
                        float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
                        half3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    		template <typename UVecType> UVecType bitFieldInsert(const UVecType width, const UVecType offset, const UVecType src2, const UVecType src3)
                    		{
                    			UVecType bitmask = (((UVecType(1) << width)-1) << offset) & 0xffffffff;
                    			return ((src2 << offset) & bitmask) | (src3 & ~bitmask);
                    		}; 
                    fragment Mtl_FragmentOut xlatMtlMain(
                        constant FGlobals_Type& FGlobals [[ buffer(0) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(1) ]],
                        sampler sampler_BaseMap [[ sampler (0) ]],
                        sampler sampler_RimMaskMap [[ sampler (1) ]],
                        sampler sampler_BaseMapEnemy [[ sampler (2) ]],
                        sampler sampler_EffectMap [[ sampler (3) ]],
                        texture2d<half, access::sample > _BaseMap [[ texture(0) ]] ,
                        texture2d<half, access::sample > _RimMaskMap [[ texture(1) ]] ,
                        texture2d<half, access::sample > _BaseMapEnemy [[ texture(2) ]] ,
                        texture2d<half, access::sample > _EffectMap [[ texture(3) ]] ,
                        float4 mtl_FragCoord [[ position ]],
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        float4 hlslcc_FragCoord = float4(mtl_FragCoord.xyz, 1.0/mtl_FragCoord.w);
                        float4 u_xlat0;
                        half2 u_xlat16_0;
                        bool3 u_xlatb0;
                        float4 u_xlat1;
                        half4 u_xlat16_1;
                        int u_xlati1;
                        uint2 u_xlatu1;
                        bool u_xlatb1;
                        half4 u_xlat16_2;
                        half3 u_xlat16_3;
                        half2 u_xlat16_4;
                        half2 u_xlat16_5;
                        float u_xlat6;
                        half3 u_xlat16_6;
                        int u_xlati7;
                        bool u_xlatb7;
                        half u_xlat16_8;
                        half3 u_xlat16_9;
                        half2 u_xlat16_16;
                        half u_xlat16_20;
                        half u_xlat16_21;
                        u_xlatb0.xyz = (half3(UnityPerMaterial._EnableEnemy, UnityPerMaterial._EnableEffect, UnityPerMaterial._Surface)==half3(1.0, 1.0, 1.0));
                        if(u_xlatb0.x){
                            u_xlat16_1 = _BaseMapEnemy.sample(sampler_BaseMapEnemy, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColorEnemy.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        } else {
                            u_xlat16_1 = _BaseMap.sample(sampler_BaseMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColor.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        }
                        if(u_xlatb0.y){
                            u_xlat1.yz = fma(FGlobals._Time.yy, float2(half2(UnityPerMaterial._EffectSpeedU, UnityPerMaterial._EffectSpeedV)), input.TEXCOORD0.zw);
                            u_xlat1.w = input.TEXCOORD0.w;
                            u_xlat16_0.xy = _EffectMap.sample(sampler_EffectMap, u_xlat1.yw, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                            u_xlat16_21 = u_xlat16_0.y + half(-0.5);
                            u_xlat16_21 = dot(half2(u_xlat16_21), half2(UnityPerMaterial._EffectDistortionIntensity));
                            u_xlat1.x = float(u_xlat16_21) + input.TEXCOORD0.z;
                            u_xlat16_6.xz = _EffectMap.sample(sampler_EffectMap, u_xlat1.xz, bias(FGlobals._GlobalMipBias.xyxx.x)).yw;
                            u_xlat16_4.xy = u_xlat16_0.xx + u_xlat16_6.zx;
                            u_xlat16_4.xy = u_xlat16_4.xy + half2(-0.850000024, -0.699999988);
                            u_xlat16_4.xy = u_xlat16_4.xy * half2(20.0000191, 3.33333325);
                            u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0h, 1.0h);
                            u_xlat16_16.xy = fma(u_xlat16_4.xy, half2(-2.0, -2.0), half2(3.0, 3.0));
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_4.xy;
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_16.xy;
                            u_xlat16_21 = u_xlat16_4.y * u_xlat16_4.x;
                            u_xlat16_3.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
                            u_xlat16_2.xyz = fma(half3(u_xlat16_21), u_xlat16_3.xyz, u_xlat16_2.xyz);
                        }
                        u_xlat16_20 = u_xlat16_2.w * UnityPerMaterial._BaseColor.w;
                        u_xlatb0.x = FGlobals.unity_OrthoParams.w==0.0;
                        u_xlat1.xyz = (-input.TEXCOORD1.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
                        u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
                        u_xlat6 = rsqrt(u_xlat6);
                        u_xlat1.xyz = float3(u_xlat6) * u_xlat1.xyz;
                        u_xlat16_3.x = (u_xlatb0.x) ? half(u_xlat1.x) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z);
                        u_xlat16_3.y = (u_xlatb0.x) ? half(u_xlat1.y) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z);
                        u_xlat16_3.z = (u_xlatb0.x) ? half(u_xlat1.z) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z);
                        u_xlat0.x = dot(input.TEXCOORD2.xyz, input.TEXCOORD2.xyz);
                        u_xlat0.x = rsqrt(u_xlat0.x);
                        u_xlat0.xyw = u_xlat0.xxx * float3(input.TEXCOORD2.xyz);
                        u_xlat1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
                        u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
                        u_xlat1.x = rsqrt(u_xlat1.x);
                        u_xlat1.xyz = u_xlat1.xxx * float3(u_xlat16_3.xyz);
                        u_xlat16_5.xy = _RimMaskMap.sample(sampler_RimMaskMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                        u_xlat1.x = dot(u_xlat0.xyw, u_xlat1.xyz);
                        u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
                        u_xlat16_3.x = half((-u_xlat1.x) + 1.0);
                        u_xlat16_9.x = dot(UnityPerMaterial._RimVector.xyz, UnityPerMaterial._RimVector.xyz);
                        u_xlat16_9.x = rsqrt(u_xlat16_9.x);
                        u_xlat16_9.xyz = u_xlat16_9.xxx * UnityPerMaterial._RimVector.xyz;
                        u_xlat0.x = dot(u_xlat0.xyw, float3(u_xlat16_9.xyz));
                        u_xlat0.x = fma(u_xlat0.x, 0.5, 0.5);
                        u_xlat16_9.x = fma((-UnityPerMaterial._RimBoaderSmooth), half(0.5), half(0.5));
                        u_xlat16_3.z = fma(UnityPerMaterial._RimBoaderSmooth, half(0.5), half(0.5));
                        u_xlat16_21 = UnityPerMaterial._RimWidth + half(-0.5);
                        u_xlat16_3.x = half(fma(float(u_xlat16_3.x), u_xlat0.x, float(u_xlat16_21)));
                        u_xlat16_3.xz = (-u_xlat16_9.xx) + u_xlat16_3.xz;
                        u_xlat16_9.x = half(1.0) / u_xlat16_3.z;
                        u_xlat16_3.x = u_xlat16_9.x * u_xlat16_3.x;
                        u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0h, 1.0h);
                        u_xlat16_9.x = fma(u_xlat16_3.x, half(-2.0), half(3.0));
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
                        u_xlat16_9.x = (-u_xlat16_5.y) + half(1.0);
                        u_xlat16_3.x = max(u_xlat16_9.x, u_xlat16_3.x);
                        u_xlat16_9.xyz = UnityPerMaterial._BaseColor.xyz * UnityPerMaterial._RimColor.xyz;
                        u_xlat0.x = dot(UnityPerMaterial._BaseColor.xyz, half3(0.298999995, 0.587000012, 0.114));
                        u_xlat6 = fma((-u_xlat0.x), u_xlat0.x, u_xlat0.x);
                        u_xlat0.x = fma((-u_xlat6), (-float(UnityPerMaterial._RimBaseColorCurve)), u_xlat0.x);
                        u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
                        u_xlat0.x = u_xlat0.x * float(u_xlat16_3.x);
                        u_xlat1.xyz = float3(u_xlat16_5.xxx) * float3(u_xlat16_9.xyz);
                        u_xlat16_3.x = (-UnityPerMaterial._EnableEnemy) + half(1.0);
                        u_xlat1.xyz = u_xlat1.xyz * float3(u_xlat16_3.xxx);
                        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
                        u_xlat1.xyz = fma(float3(u_xlat16_2.xyz), float3(UnityPerMaterial._BaseColor.xyz), u_xlat1.xyz);
                        u_xlat16_2.xyz = (-UnityPerMaterial._SubColor.xyz) + half3(1.0, 1.0, 1.0);
                        u_xlat16_2.xyz = half3(fma(u_xlat0.xxx, float3(u_xlat16_2.xyz), float3(UnityPerMaterial._SubColor.xyz)));
                        u_xlat0.xyw = u_xlat1.xyz * float3(u_xlat16_2.xyz);
                        u_xlat1.xy = FGlobals._ScreenParams.zw + float2(-1.0, -1.0);
                        u_xlat1.xy = u_xlat1.xy * hlslcc_FragCoord.xy;
                        u_xlat1.xy = u_xlat1.xy * FGlobals._ScreenParams.xy;
                        u_xlatu1.xy = uint2(u_xlat1.xy);
                        u_xlati1 = int(bitFieldInsert(0x3u, 0x3u, u_xlatu1.x, 0x0u));
                        u_xlati1 = int(bitFieldInsert(0x3u, 0x0u, u_xlatu1.y, uint(u_xlati1)));
                        u_xlat1.x = fma((-ImmCB_0[u_xlati1].x), 0.015625, float(u_xlat16_20));
                        u_xlatb1 = u_xlat1.x<0.0;
                        if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard_fragment();}
                        u_xlatb1 = UnityPerMaterial._EnableDissolve==half(1.0);
                        u_xlati7 = int((UnityPerMaterial._DissolveAlpha>=u_xlat16_20) ? 0xFFFFFFFFu : uint(0));
                        u_xlat16_2.x = (u_xlati7 != 0) ? half(1.0) : half(0.0);
                        u_xlatb7 = u_xlati7==0x0;
                        u_xlatb7 = u_xlatb1 && u_xlatb7;
                        if(((int(u_xlatb7) * int(0xffffffffu)))!=0){discard_fragment();}
                        u_xlat16_8 = (u_xlatb0.z) ? u_xlat16_20 : half(1.0);
                        output.SV_Target0.w = (u_xlatb1) ? u_xlat16_2.x : u_xlat16_8;
                        output.SV_Target0.xyz = half3(u_xlat0.xyw);
                        return output;
                    }
                    "
                }
                SubProgram "metal " {
                    Keywords { "_ADDITIONAL_LIGHTS" "_LIGHT_COOKIES" "_MAIN_LIGHT_SHADOWS" }
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    #ifndef XLT_REMAP_O
                    	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
                    #endif
                    constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
                    struct FGlobals_Type
                    {
                        float4 _Time;
                        float3 _WorldSpaceCameraPos;
                        float2 _GlobalMipBias;
                        float4 unity_OrthoParams;
                        float4 hlslcc_mtx4x4unity_MatrixV[4];
                    };
                    
                    struct UnityPerMaterial_Type
                    {
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_FragmentIn
                    {
                        float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
                        float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
                        half3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    fragment Mtl_FragmentOut xlatMtlMain(
                        constant FGlobals_Type& FGlobals [[ buffer(0) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(1) ]],
                        sampler sampler_BaseMap [[ sampler (0) ]],
                        sampler sampler_RimMaskMap [[ sampler (1) ]],
                        sampler sampler_BaseMapEnemy [[ sampler (2) ]],
                        sampler sampler_EffectMap [[ sampler (3) ]],
                        texture2d<half, access::sample > _BaseMap [[ texture(0) ]] ,
                        texture2d<half, access::sample > _RimMaskMap [[ texture(1) ]] ,
                        texture2d<half, access::sample > _BaseMapEnemy [[ texture(2) ]] ,
                        texture2d<half, access::sample > _EffectMap [[ texture(3) ]] ,
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        float4 u_xlat0;
                        half2 u_xlat16_0;
                        bool3 u_xlatb0;
                        float4 u_xlat1;
                        half4 u_xlat16_1;
                        bool u_xlatb1;
                        half4 u_xlat16_2;
                        half3 u_xlat16_3;
                        half2 u_xlat16_4;
                        half2 u_xlat16_5;
                        float u_xlat6;
                        half3 u_xlat16_6;
                        int u_xlati7;
                        bool u_xlatb7;
                        half u_xlat16_8;
                        half3 u_xlat16_9;
                        half2 u_xlat16_16;
                        half u_xlat16_20;
                        half u_xlat16_21;
                        u_xlatb0.xyz = (half3(UnityPerMaterial._EnableEnemy, UnityPerMaterial._EnableEffect, UnityPerMaterial._Surface)==half3(1.0, 1.0, 1.0));
                        if(u_xlatb0.x){
                            u_xlat16_1 = _BaseMapEnemy.sample(sampler_BaseMapEnemy, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColorEnemy.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        } else {
                            u_xlat16_1 = _BaseMap.sample(sampler_BaseMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColor.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        }
                        if(u_xlatb0.y){
                            u_xlat1.yz = fma(FGlobals._Time.yy, float2(half2(UnityPerMaterial._EffectSpeedU, UnityPerMaterial._EffectSpeedV)), input.TEXCOORD0.zw);
                            u_xlat1.w = input.TEXCOORD0.w;
                            u_xlat16_0.xy = _EffectMap.sample(sampler_EffectMap, u_xlat1.yw, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                            u_xlat16_21 = u_xlat16_0.y + half(-0.5);
                            u_xlat16_21 = dot(half2(u_xlat16_21), half2(UnityPerMaterial._EffectDistortionIntensity));
                            u_xlat1.x = float(u_xlat16_21) + input.TEXCOORD0.z;
                            u_xlat16_6.xz = _EffectMap.sample(sampler_EffectMap, u_xlat1.xz, bias(FGlobals._GlobalMipBias.xyxx.x)).yw;
                            u_xlat16_4.xy = u_xlat16_0.xx + u_xlat16_6.zx;
                            u_xlat16_4.xy = u_xlat16_4.xy + half2(-0.850000024, -0.699999988);
                            u_xlat16_4.xy = u_xlat16_4.xy * half2(20.0000191, 3.33333325);
                            u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0h, 1.0h);
                            u_xlat16_16.xy = fma(u_xlat16_4.xy, half2(-2.0, -2.0), half2(3.0, 3.0));
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_4.xy;
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_16.xy;
                            u_xlat16_21 = u_xlat16_4.y * u_xlat16_4.x;
                            u_xlat16_3.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
                            u_xlat16_2.xyz = fma(half3(u_xlat16_21), u_xlat16_3.xyz, u_xlat16_2.xyz);
                        }
                        u_xlat16_20 = u_xlat16_2.w * UnityPerMaterial._BaseColor.w;
                        u_xlatb0.x = FGlobals.unity_OrthoParams.w==0.0;
                        u_xlat1.xyz = (-input.TEXCOORD1.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
                        u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
                        u_xlat6 = rsqrt(u_xlat6);
                        u_xlat1.xyz = float3(u_xlat6) * u_xlat1.xyz;
                        u_xlat16_3.x = (u_xlatb0.x) ? half(u_xlat1.x) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z);
                        u_xlat16_3.y = (u_xlatb0.x) ? half(u_xlat1.y) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z);
                        u_xlat16_3.z = (u_xlatb0.x) ? half(u_xlat1.z) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z);
                        u_xlat0.x = dot(input.TEXCOORD2.xyz, input.TEXCOORD2.xyz);
                        u_xlat0.x = rsqrt(u_xlat0.x);
                        u_xlat0.xyw = u_xlat0.xxx * float3(input.TEXCOORD2.xyz);
                        u_xlat1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
                        u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
                        u_xlat1.x = rsqrt(u_xlat1.x);
                        u_xlat1.xyz = u_xlat1.xxx * float3(u_xlat16_3.xyz);
                        u_xlat16_5.xy = _RimMaskMap.sample(sampler_RimMaskMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                        u_xlat1.x = dot(u_xlat0.xyw, u_xlat1.xyz);
                        u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
                        u_xlat16_3.x = half((-u_xlat1.x) + 1.0);
                        u_xlat16_9.x = dot(UnityPerMaterial._RimVector.xyz, UnityPerMaterial._RimVector.xyz);
                        u_xlat16_9.x = rsqrt(u_xlat16_9.x);
                        u_xlat16_9.xyz = u_xlat16_9.xxx * UnityPerMaterial._RimVector.xyz;
                        u_xlat0.x = dot(u_xlat0.xyw, float3(u_xlat16_9.xyz));
                        u_xlat0.x = fma(u_xlat0.x, 0.5, 0.5);
                        u_xlat16_9.x = fma((-UnityPerMaterial._RimBoaderSmooth), half(0.5), half(0.5));
                        u_xlat16_3.z = fma(UnityPerMaterial._RimBoaderSmooth, half(0.5), half(0.5));
                        u_xlat16_21 = UnityPerMaterial._RimWidth + half(-0.5);
                        u_xlat16_3.x = half(fma(float(u_xlat16_3.x), u_xlat0.x, float(u_xlat16_21)));
                        u_xlat16_3.xz = (-u_xlat16_9.xx) + u_xlat16_3.xz;
                        u_xlat16_9.x = half(1.0) / u_xlat16_3.z;
                        u_xlat16_3.x = u_xlat16_9.x * u_xlat16_3.x;
                        u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0h, 1.0h);
                        u_xlat16_9.x = fma(u_xlat16_3.x, half(-2.0), half(3.0));
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
                        u_xlat16_9.x = (-u_xlat16_5.y) + half(1.0);
                        u_xlat16_3.x = max(u_xlat16_9.x, u_xlat16_3.x);
                        u_xlat16_9.xyz = UnityPerMaterial._BaseColor.xyz * UnityPerMaterial._RimColor.xyz;
                        u_xlat0.x = dot(UnityPerMaterial._BaseColor.xyz, half3(0.298999995, 0.587000012, 0.114));
                        u_xlat6 = fma((-u_xlat0.x), u_xlat0.x, u_xlat0.x);
                        u_xlat0.x = fma((-u_xlat6), (-float(UnityPerMaterial._RimBaseColorCurve)), u_xlat0.x);
                        u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
                        u_xlat0.x = u_xlat0.x * float(u_xlat16_3.x);
                        u_xlat1.xyz = float3(u_xlat16_5.xxx) * float3(u_xlat16_9.xyz);
                        u_xlat16_3.x = (-UnityPerMaterial._EnableEnemy) + half(1.0);
                        u_xlat1.xyz = u_xlat1.xyz * float3(u_xlat16_3.xxx);
                        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
                        u_xlat1.xyz = fma(float3(u_xlat16_2.xyz), float3(UnityPerMaterial._BaseColor.xyz), u_xlat1.xyz);
                        u_xlat16_2.xyz = (-UnityPerMaterial._SubColor.xyz) + half3(1.0, 1.0, 1.0);
                        u_xlat16_2.xyz = half3(fma(u_xlat0.xxx, float3(u_xlat16_2.xyz), float3(UnityPerMaterial._SubColor.xyz)));
                        u_xlat0.xyw = u_xlat1.xyz * float3(u_xlat16_2.xyz);
                        u_xlatb1 = UnityPerMaterial._EnableDissolve==half(1.0);
                        u_xlati7 = int((UnityPerMaterial._DissolveAlpha>=u_xlat16_20) ? 0xFFFFFFFFu : uint(0));
                        u_xlat16_2.x = (u_xlati7 != 0) ? half(1.0) : half(0.0);
                        u_xlatb7 = u_xlati7==0x0;
                        u_xlatb7 = u_xlatb1 && u_xlatb7;
                        if(((int(u_xlatb7) * int(0xffffffffu)))!=0){discard_fragment();}
                        u_xlat16_8 = (u_xlatb0.z) ? u_xlat16_20 : half(1.0);
                        output.SV_Target0.w = (u_xlatb1) ? u_xlat16_2.x : u_xlat16_8;
                        output.SV_Target0.xyz = half3(u_xlat0.xyw);
                        return output;
                    }
                    "
                }
                SubProgram "metal " {
                    Keywords { "_ADDITIONAL_LIGHTS" "_ENABLE_DITHER_BASECOLOR_ALPHA" "_MAIN_LIGHT_SHADOWS" }
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    constant float4 ImmCB_0[64] =
                    {
                    	float4(0.5, 0.0, 0.0, 0.0),
                    	float4(48.5, 0.0, 0.0, 0.0),
                    	float4(12.5, 0.0, 0.0, 0.0),
                    	float4(60.5, 0.0, 0.0, 0.0),
                    	float4(3.5, 0.0, 0.0, 0.0),
                    	float4(51.5, 0.0, 0.0, 0.0),
                    	float4(15.5, 0.0, 0.0, 0.0),
                    	float4(63.5, 0.0, 0.0, 0.0),
                    	float4(32.5, 0.0, 0.0, 0.0),
                    	float4(16.5, 0.0, 0.0, 0.0),
                    	float4(44.5, 0.0, 0.0, 0.0),
                    	float4(28.5, 0.0, 0.0, 0.0),
                    	float4(35.5, 0.0, 0.0, 0.0),
                    	float4(19.5, 0.0, 0.0, 0.0),
                    	float4(47.5, 0.0, 0.0, 0.0),
                    	float4(31.5, 0.0, 0.0, 0.0),
                    	float4(8.5, 0.0, 0.0, 0.0),
                    	float4(56.5, 0.0, 0.0, 0.0),
                    	float4(4.5, 0.0, 0.0, 0.0),
                    	float4(52.5, 0.0, 0.0, 0.0),
                    	float4(11.5, 0.0, 0.0, 0.0),
                    	float4(59.5, 0.0, 0.0, 0.0),
                    	float4(7.5, 0.0, 0.0, 0.0),
                    	float4(55.5, 0.0, 0.0, 0.0),
                    	float4(40.5, 0.0, 0.0, 0.0),
                    	float4(24.5, 0.0, 0.0, 0.0),
                    	float4(36.5, 0.0, 0.0, 0.0),
                    	float4(20.5, 0.0, 0.0, 0.0),
                    	float4(43.5, 0.0, 0.0, 0.0),
                    	float4(27.5, 0.0, 0.0, 0.0),
                    	float4(39.5, 0.0, 0.0, 0.0),
                    	float4(23.5, 0.0, 0.0, 0.0),
                    	float4(2.5, 0.0, 0.0, 0.0),
                    	float4(50.5, 0.0, 0.0, 0.0),
                    	float4(14.5, 0.0, 0.0, 0.0),
                    	float4(62.5, 0.0, 0.0, 0.0),
                    	float4(1.5, 0.0, 0.0, 0.0),
                    	float4(49.5, 0.0, 0.0, 0.0),
                    	float4(13.5, 0.0, 0.0, 0.0),
                    	float4(61.5, 0.0, 0.0, 0.0),
                    	float4(34.5, 0.0, 0.0, 0.0),
                    	float4(18.5, 0.0, 0.0, 0.0),
                    	float4(46.5, 0.0, 0.0, 0.0),
                    	float4(30.5, 0.0, 0.0, 0.0),
                    	float4(33.5, 0.0, 0.0, 0.0),
                    	float4(17.5, 0.0, 0.0, 0.0),
                    	float4(45.5, 0.0, 0.0, 0.0),
                    	float4(29.5, 0.0, 0.0, 0.0),
                    	float4(10.5, 0.0, 0.0, 0.0),
                    	float4(58.5, 0.0, 0.0, 0.0),
                    	float4(6.5, 0.0, 0.0, 0.0),
                    	float4(54.5, 0.0, 0.0, 0.0),
                    	float4(9.5, 0.0, 0.0, 0.0),
                    	float4(57.5, 0.0, 0.0, 0.0),
                    	float4(5.5, 0.0, 0.0, 0.0),
                    	float4(53.5, 0.0, 0.0, 0.0),
                    	float4(42.5, 0.0, 0.0, 0.0),
                    	float4(26.5, 0.0, 0.0, 0.0),
                    	float4(38.5, 0.0, 0.0, 0.0),
                    	float4(22.5, 0.0, 0.0, 0.0),
                    	float4(41.5, 0.0, 0.0, 0.0),
                    	float4(25.5, 0.0, 0.0, 0.0),
                    	float4(37.5, 0.0, 0.0, 0.0),
                    	float4(21.5, 0.0, 0.0, 0.0)
                    };
                    #ifndef XLT_REMAP_O
                    	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
                    #endif
                    constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
                    struct FGlobals_Type
                    {
                        float4 _Time;
                        float3 _WorldSpaceCameraPos;
                        float4 _ScreenParams;
                        float2 _GlobalMipBias;
                        float4 unity_OrthoParams;
                        float4 hlslcc_mtx4x4unity_MatrixV[4];
                    };
                    
                    struct UnityPerMaterial_Type
                    {
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_FragmentIn
                    {
                        float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
                        float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
                        half3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    		template <typename UVecType> UVecType bitFieldInsert(const UVecType width, const UVecType offset, const UVecType src2, const UVecType src3)
                    		{
                    			UVecType bitmask = (((UVecType(1) << width)-1) << offset) & 0xffffffff;
                    			return ((src2 << offset) & bitmask) | (src3 & ~bitmask);
                    		}; 
                    fragment Mtl_FragmentOut xlatMtlMain(
                        constant FGlobals_Type& FGlobals [[ buffer(0) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(1) ]],
                        sampler sampler_BaseMap [[ sampler (0) ]],
                        sampler sampler_RimMaskMap [[ sampler (1) ]],
                        sampler sampler_BaseMapEnemy [[ sampler (2) ]],
                        sampler sampler_EffectMap [[ sampler (3) ]],
                        texture2d<half, access::sample > _BaseMap [[ texture(0) ]] ,
                        texture2d<half, access::sample > _RimMaskMap [[ texture(1) ]] ,
                        texture2d<half, access::sample > _BaseMapEnemy [[ texture(2) ]] ,
                        texture2d<half, access::sample > _EffectMap [[ texture(3) ]] ,
                        float4 mtl_FragCoord [[ position ]],
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        float4 hlslcc_FragCoord = float4(mtl_FragCoord.xyz, 1.0/mtl_FragCoord.w);
                        float4 u_xlat0;
                        half2 u_xlat16_0;
                        bool3 u_xlatb0;
                        float4 u_xlat1;
                        half4 u_xlat16_1;
                        int u_xlati1;
                        uint2 u_xlatu1;
                        bool u_xlatb1;
                        half4 u_xlat16_2;
                        half3 u_xlat16_3;
                        half2 u_xlat16_4;
                        half2 u_xlat16_5;
                        float u_xlat6;
                        half3 u_xlat16_6;
                        int u_xlati7;
                        bool u_xlatb7;
                        half u_xlat16_8;
                        half3 u_xlat16_9;
                        half2 u_xlat16_16;
                        half u_xlat16_20;
                        half u_xlat16_21;
                        u_xlatb0.xyz = (half3(UnityPerMaterial._EnableEnemy, UnityPerMaterial._EnableEffect, UnityPerMaterial._Surface)==half3(1.0, 1.0, 1.0));
                        if(u_xlatb0.x){
                            u_xlat16_1 = _BaseMapEnemy.sample(sampler_BaseMapEnemy, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColorEnemy.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        } else {
                            u_xlat16_1 = _BaseMap.sample(sampler_BaseMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColor.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        }
                        if(u_xlatb0.y){
                            u_xlat1.yz = fma(FGlobals._Time.yy, float2(half2(UnityPerMaterial._EffectSpeedU, UnityPerMaterial._EffectSpeedV)), input.TEXCOORD0.zw);
                            u_xlat1.w = input.TEXCOORD0.w;
                            u_xlat16_0.xy = _EffectMap.sample(sampler_EffectMap, u_xlat1.yw, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                            u_xlat16_21 = u_xlat16_0.y + half(-0.5);
                            u_xlat16_21 = dot(half2(u_xlat16_21), half2(UnityPerMaterial._EffectDistortionIntensity));
                            u_xlat1.x = float(u_xlat16_21) + input.TEXCOORD0.z;
                            u_xlat16_6.xz = _EffectMap.sample(sampler_EffectMap, u_xlat1.xz, bias(FGlobals._GlobalMipBias.xyxx.x)).yw;
                            u_xlat16_4.xy = u_xlat16_0.xx + u_xlat16_6.zx;
                            u_xlat16_4.xy = u_xlat16_4.xy + half2(-0.850000024, -0.699999988);
                            u_xlat16_4.xy = u_xlat16_4.xy * half2(20.0000191, 3.33333325);
                            u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0h, 1.0h);
                            u_xlat16_16.xy = fma(u_xlat16_4.xy, half2(-2.0, -2.0), half2(3.0, 3.0));
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_4.xy;
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_16.xy;
                            u_xlat16_21 = u_xlat16_4.y * u_xlat16_4.x;
                            u_xlat16_3.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
                            u_xlat16_2.xyz = fma(half3(u_xlat16_21), u_xlat16_3.xyz, u_xlat16_2.xyz);
                        }
                        u_xlat16_20 = u_xlat16_2.w * UnityPerMaterial._BaseColor.w;
                        u_xlatb0.x = FGlobals.unity_OrthoParams.w==0.0;
                        u_xlat1.xyz = (-input.TEXCOORD1.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
                        u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
                        u_xlat6 = rsqrt(u_xlat6);
                        u_xlat1.xyz = float3(u_xlat6) * u_xlat1.xyz;
                        u_xlat16_3.x = (u_xlatb0.x) ? half(u_xlat1.x) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z);
                        u_xlat16_3.y = (u_xlatb0.x) ? half(u_xlat1.y) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z);
                        u_xlat16_3.z = (u_xlatb0.x) ? half(u_xlat1.z) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z);
                        u_xlat0.x = dot(input.TEXCOORD2.xyz, input.TEXCOORD2.xyz);
                        u_xlat0.x = rsqrt(u_xlat0.x);
                        u_xlat0.xyw = u_xlat0.xxx * float3(input.TEXCOORD2.xyz);
                        u_xlat1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
                        u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
                        u_xlat1.x = rsqrt(u_xlat1.x);
                        u_xlat1.xyz = u_xlat1.xxx * float3(u_xlat16_3.xyz);
                        u_xlat16_5.xy = _RimMaskMap.sample(sampler_RimMaskMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                        u_xlat1.x = dot(u_xlat0.xyw, u_xlat1.xyz);
                        u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
                        u_xlat16_3.x = half((-u_xlat1.x) + 1.0);
                        u_xlat16_9.x = dot(UnityPerMaterial._RimVector.xyz, UnityPerMaterial._RimVector.xyz);
                        u_xlat16_9.x = rsqrt(u_xlat16_9.x);
                        u_xlat16_9.xyz = u_xlat16_9.xxx * UnityPerMaterial._RimVector.xyz;
                        u_xlat0.x = dot(u_xlat0.xyw, float3(u_xlat16_9.xyz));
                        u_xlat0.x = fma(u_xlat0.x, 0.5, 0.5);
                        u_xlat16_9.x = fma((-UnityPerMaterial._RimBoaderSmooth), half(0.5), half(0.5));
                        u_xlat16_3.z = fma(UnityPerMaterial._RimBoaderSmooth, half(0.5), half(0.5));
                        u_xlat16_21 = UnityPerMaterial._RimWidth + half(-0.5);
                        u_xlat16_3.x = half(fma(float(u_xlat16_3.x), u_xlat0.x, float(u_xlat16_21)));
                        u_xlat16_3.xz = (-u_xlat16_9.xx) + u_xlat16_3.xz;
                        u_xlat16_9.x = half(1.0) / u_xlat16_3.z;
                        u_xlat16_3.x = u_xlat16_9.x * u_xlat16_3.x;
                        u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0h, 1.0h);
                        u_xlat16_9.x = fma(u_xlat16_3.x, half(-2.0), half(3.0));
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
                        u_xlat16_9.x = (-u_xlat16_5.y) + half(1.0);
                        u_xlat16_3.x = max(u_xlat16_9.x, u_xlat16_3.x);
                        u_xlat16_9.xyz = UnityPerMaterial._BaseColor.xyz * UnityPerMaterial._RimColor.xyz;
                        u_xlat0.x = dot(UnityPerMaterial._BaseColor.xyz, half3(0.298999995, 0.587000012, 0.114));
                        u_xlat6 = fma((-u_xlat0.x), u_xlat0.x, u_xlat0.x);
                        u_xlat0.x = fma((-u_xlat6), (-float(UnityPerMaterial._RimBaseColorCurve)), u_xlat0.x);
                        u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
                        u_xlat0.x = u_xlat0.x * float(u_xlat16_3.x);
                        u_xlat1.xyz = float3(u_xlat16_5.xxx) * float3(u_xlat16_9.xyz);
                        u_xlat16_3.x = (-UnityPerMaterial._EnableEnemy) + half(1.0);
                        u_xlat1.xyz = u_xlat1.xyz * float3(u_xlat16_3.xxx);
                        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
                        u_xlat1.xyz = fma(float3(u_xlat16_2.xyz), float3(UnityPerMaterial._BaseColor.xyz), u_xlat1.xyz);
                        u_xlat16_2.xyz = (-UnityPerMaterial._SubColor.xyz) + half3(1.0, 1.0, 1.0);
                        u_xlat16_2.xyz = half3(fma(u_xlat0.xxx, float3(u_xlat16_2.xyz), float3(UnityPerMaterial._SubColor.xyz)));
                        u_xlat0.xyw = u_xlat1.xyz * float3(u_xlat16_2.xyz);
                        u_xlat1.xy = FGlobals._ScreenParams.zw + float2(-1.0, -1.0);
                        u_xlat1.xy = u_xlat1.xy * hlslcc_FragCoord.xy;
                        u_xlat1.xy = u_xlat1.xy * FGlobals._ScreenParams.xy;
                        u_xlatu1.xy = uint2(u_xlat1.xy);
                        u_xlati1 = int(bitFieldInsert(0x3u, 0x3u, u_xlatu1.x, 0x0u));
                        u_xlati1 = int(bitFieldInsert(0x3u, 0x0u, u_xlatu1.y, uint(u_xlati1)));
                        u_xlat1.x = fma((-ImmCB_0[u_xlati1].x), 0.015625, float(u_xlat16_20));
                        u_xlatb1 = u_xlat1.x<0.0;
                        if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard_fragment();}
                        u_xlatb1 = UnityPerMaterial._EnableDissolve==half(1.0);
                        u_xlati7 = int((UnityPerMaterial._DissolveAlpha>=u_xlat16_20) ? 0xFFFFFFFFu : uint(0));
                        u_xlat16_2.x = (u_xlati7 != 0) ? half(1.0) : half(0.0);
                        u_xlatb7 = u_xlati7==0x0;
                        u_xlatb7 = u_xlatb1 && u_xlatb7;
                        if(((int(u_xlatb7) * int(0xffffffffu)))!=0){discard_fragment();}
                        u_xlat16_8 = (u_xlatb0.z) ? u_xlat16_20 : half(1.0);
                        output.SV_Target0.w = (u_xlatb1) ? u_xlat16_2.x : u_xlat16_8;
                        output.SV_Target0.xyz = half3(u_xlat0.xyw);
                        return output;
                    }
                    "
                }
                SubProgram "metal " {
                    Keywords { "_ADDITIONAL_LIGHTS" "_MAIN_LIGHT_SHADOWS" }
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    #ifndef XLT_REMAP_O
                    	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
                    #endif
                    constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
                    struct FGlobals_Type
                    {
                        float4 _Time;
                        float3 _WorldSpaceCameraPos;
                        float2 _GlobalMipBias;
                        float4 unity_OrthoParams;
                        float4 hlslcc_mtx4x4unity_MatrixV[4];
                    };
                    
                    struct UnityPerMaterial_Type
                    {
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_FragmentIn
                    {
                        float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
                        float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
                        half3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    fragment Mtl_FragmentOut xlatMtlMain(
                        constant FGlobals_Type& FGlobals [[ buffer(0) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(1) ]],
                        sampler sampler_BaseMap [[ sampler (0) ]],
                        sampler sampler_RimMaskMap [[ sampler (1) ]],
                        sampler sampler_BaseMapEnemy [[ sampler (2) ]],
                        sampler sampler_EffectMap [[ sampler (3) ]],
                        texture2d<half, access::sample > _BaseMap [[ texture(0) ]] ,
                        texture2d<half, access::sample > _RimMaskMap [[ texture(1) ]] ,
                        texture2d<half, access::sample > _BaseMapEnemy [[ texture(2) ]] ,
                        texture2d<half, access::sample > _EffectMap [[ texture(3) ]] ,
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        float4 u_xlat0;
                        half2 u_xlat16_0;
                        bool3 u_xlatb0;
                        float4 u_xlat1;
                        half4 u_xlat16_1;
                        bool u_xlatb1;
                        half4 u_xlat16_2;
                        half3 u_xlat16_3;
                        half2 u_xlat16_4;
                        half2 u_xlat16_5;
                        float u_xlat6;
                        half3 u_xlat16_6;
                        int u_xlati7;
                        bool u_xlatb7;
                        half u_xlat16_8;
                        half3 u_xlat16_9;
                        half2 u_xlat16_16;
                        half u_xlat16_20;
                        half u_xlat16_21;
                        u_xlatb0.xyz = (half3(UnityPerMaterial._EnableEnemy, UnityPerMaterial._EnableEffect, UnityPerMaterial._Surface)==half3(1.0, 1.0, 1.0));
                        if(u_xlatb0.x){
                            u_xlat16_1 = _BaseMapEnemy.sample(sampler_BaseMapEnemy, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColorEnemy.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        } else {
                            u_xlat16_1 = _BaseMap.sample(sampler_BaseMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                            u_xlat16_3.xyz = UnityPerMaterial._EffectColor.xyz;
                            u_xlat16_2 = u_xlat16_1;
                        }
                        if(u_xlatb0.y){
                            u_xlat1.yz = fma(FGlobals._Time.yy, float2(half2(UnityPerMaterial._EffectSpeedU, UnityPerMaterial._EffectSpeedV)), input.TEXCOORD0.zw);
                            u_xlat1.w = input.TEXCOORD0.w;
                            u_xlat16_0.xy = _EffectMap.sample(sampler_EffectMap, u_xlat1.yw, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                            u_xlat16_21 = u_xlat16_0.y + half(-0.5);
                            u_xlat16_21 = dot(half2(u_xlat16_21), half2(UnityPerMaterial._EffectDistortionIntensity));
                            u_xlat1.x = float(u_xlat16_21) + input.TEXCOORD0.z;
                            u_xlat16_6.xz = _EffectMap.sample(sampler_EffectMap, u_xlat1.xz, bias(FGlobals._GlobalMipBias.xyxx.x)).yw;
                            u_xlat16_4.xy = u_xlat16_0.xx + u_xlat16_6.zx;
                            u_xlat16_4.xy = u_xlat16_4.xy + half2(-0.850000024, -0.699999988);
                            u_xlat16_4.xy = u_xlat16_4.xy * half2(20.0000191, 3.33333325);
                            u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0h, 1.0h);
                            u_xlat16_16.xy = fma(u_xlat16_4.xy, half2(-2.0, -2.0), half2(3.0, 3.0));
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_4.xy;
                            u_xlat16_4.xy = u_xlat16_4.xy * u_xlat16_16.xy;
                            u_xlat16_21 = u_xlat16_4.y * u_xlat16_4.x;
                            u_xlat16_3.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
                            u_xlat16_2.xyz = fma(half3(u_xlat16_21), u_xlat16_3.xyz, u_xlat16_2.xyz);
                        }
                        u_xlat16_20 = u_xlat16_2.w * UnityPerMaterial._BaseColor.w;
                        u_xlatb0.x = FGlobals.unity_OrthoParams.w==0.0;
                        u_xlat1.xyz = (-input.TEXCOORD1.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
                        u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
                        u_xlat6 = rsqrt(u_xlat6);
                        u_xlat1.xyz = float3(u_xlat6) * u_xlat1.xyz;
                        u_xlat16_3.x = (u_xlatb0.x) ? half(u_xlat1.x) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z);
                        u_xlat16_3.y = (u_xlatb0.x) ? half(u_xlat1.y) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z);
                        u_xlat16_3.z = (u_xlatb0.x) ? half(u_xlat1.z) : half(FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z);
                        u_xlat0.x = dot(input.TEXCOORD2.xyz, input.TEXCOORD2.xyz);
                        u_xlat0.x = rsqrt(u_xlat0.x);
                        u_xlat0.xyw = u_xlat0.xxx * float3(input.TEXCOORD2.xyz);
                        u_xlat1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
                        u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
                        u_xlat1.x = rsqrt(u_xlat1.x);
                        u_xlat1.xyz = u_xlat1.xxx * float3(u_xlat16_3.xyz);
                        u_xlat16_5.xy = _RimMaskMap.sample(sampler_RimMaskMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x)).xz;
                        u_xlat1.x = dot(u_xlat0.xyw, u_xlat1.xyz);
                        u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
                        u_xlat16_3.x = half((-u_xlat1.x) + 1.0);
                        u_xlat16_9.x = dot(UnityPerMaterial._RimVector.xyz, UnityPerMaterial._RimVector.xyz);
                        u_xlat16_9.x = rsqrt(u_xlat16_9.x);
                        u_xlat16_9.xyz = u_xlat16_9.xxx * UnityPerMaterial._RimVector.xyz;
                        u_xlat0.x = dot(u_xlat0.xyw, float3(u_xlat16_9.xyz));
                        u_xlat0.x = fma(u_xlat0.x, 0.5, 0.5);
                        u_xlat16_9.x = fma((-UnityPerMaterial._RimBoaderSmooth), half(0.5), half(0.5));
                        u_xlat16_3.z = fma(UnityPerMaterial._RimBoaderSmooth, half(0.5), half(0.5));
                        u_xlat16_21 = UnityPerMaterial._RimWidth + half(-0.5);
                        u_xlat16_3.x = half(fma(float(u_xlat16_3.x), u_xlat0.x, float(u_xlat16_21)));
                        u_xlat16_3.xz = (-u_xlat16_9.xx) + u_xlat16_3.xz;
                        u_xlat16_9.x = half(1.0) / u_xlat16_3.z;
                        u_xlat16_3.x = u_xlat16_9.x * u_xlat16_3.x;
                        u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0h, 1.0h);
                        u_xlat16_9.x = fma(u_xlat16_3.x, half(-2.0), half(3.0));
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
                        u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
                        u_xlat16_9.x = (-u_xlat16_5.y) + half(1.0);
                        u_xlat16_3.x = max(u_xlat16_9.x, u_xlat16_3.x);
                        u_xlat16_9.xyz = UnityPerMaterial._BaseColor.xyz * UnityPerMaterial._RimColor.xyz;
                        u_xlat0.x = dot(UnityPerMaterial._BaseColor.xyz, half3(0.298999995, 0.587000012, 0.114));
                        u_xlat6 = fma((-u_xlat0.x), u_xlat0.x, u_xlat0.x);
                        u_xlat0.x = fma((-u_xlat6), (-float(UnityPerMaterial._RimBaseColorCurve)), u_xlat0.x);
                        u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
                        u_xlat0.x = u_xlat0.x * float(u_xlat16_3.x);
                        u_xlat1.xyz = float3(u_xlat16_5.xxx) * float3(u_xlat16_9.xyz);
                        u_xlat16_3.x = (-UnityPerMaterial._EnableEnemy) + half(1.0);
                        u_xlat1.xyz = u_xlat1.xyz * float3(u_xlat16_3.xxx);
                        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
                        u_xlat1.xyz = fma(float3(u_xlat16_2.xyz), float3(UnityPerMaterial._BaseColor.xyz), u_xlat1.xyz);
                        u_xlat16_2.xyz = (-UnityPerMaterial._SubColor.xyz) + half3(1.0, 1.0, 1.0);
                        u_xlat16_2.xyz = half3(fma(u_xlat0.xxx, float3(u_xlat16_2.xyz), float3(UnityPerMaterial._SubColor.xyz)));
                        u_xlat0.xyw = u_xlat1.xyz * float3(u_xlat16_2.xyz);
                        u_xlatb1 = UnityPerMaterial._EnableDissolve==half(1.0);
                        u_xlati7 = int((UnityPerMaterial._DissolveAlpha>=u_xlat16_20) ? 0xFFFFFFFFu : uint(0));
                        u_xlat16_2.x = (u_xlati7 != 0) ? half(1.0) : half(0.0);
                        u_xlatb7 = u_xlati7==0x0;
                        u_xlatb7 = u_xlatb1 && u_xlatb7;
                        if(((int(u_xlatb7) * int(0xffffffffu)))!=0){discard_fragment();}
                        u_xlat16_8 = (u_xlatb0.z) ? u_xlat16_20 : half(1.0);
                        output.SV_Target0.w = (u_xlatb1) ? u_xlat16_2.x : u_xlat16_8;
                        output.SV_Target0.xyz = half3(u_xlat0.xyw);
                        return output;
                    }
                    "
                }
            }
        }
        Pass {
            Name "InvertedHullOutline"
            LOD 300
            Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "InvertedHullOutline" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "4.5" "UniversalMaterialType" = "SimpleLit" }
            Cull Front
            GpuProgramID 96043
            PlayerProgram "vp" {
                SubProgram "metal " {
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    struct VGlobals_Type
                    {
                        float3 _WorldSpaceCameraPos;
                        float4 _ScreenParams;
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
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_VertexIn
                    {
                        float4 POSITION0 [[ attribute(0) ]] ;
                        float2 TEXCOORD0 [[ attribute(1) ]] ;
                        float3 TEXCOORD3 [[ attribute(2) ]] ;
                        float4 COLOR0 [[ attribute(3) ]] ;
                        float3 NORMAL0 [[ attribute(4) ]] ;
                        float4 TANGENT0 [[ attribute(5) ]] ;
                    };
                    
                    struct Mtl_VertexOut
                    {
                        float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
                        float TEXCOORD1 [[ user(TEXCOORD1) ]];
                        float4 mtl_Position [[ position, invariant ]];
                        float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
                        float3 TEXCOORD3 [[ user(TEXCOORD3) ]];
                        float3 TEXCOORD4 [[ user(TEXCOORD4) ]];
                    };
                    
                    vertex Mtl_VertexOut xlatMtlMain(
                        constant VGlobals_Type& VGlobals [[ buffer(0) ]],
                        constant UnityPerDraw_Type& UnityPerDraw [[ buffer(1) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(2) ]],
                        Mtl_VertexIn input [[ stage_in ]])
                    {
                        Mtl_VertexOut output;
                        float4 u_xlat0;
                        bool2 u_xlatb0;
                        float4 u_xlat1;
                        float3 u_xlat2;
                        half3 u_xlat16_3;
                        half3 u_xlat16_4;
                        float3 u_xlat5;
                        float2 u_xlat12;
                        float2 u_xlat13;
                        float u_xlat18;
                        bool u_xlatb18;
                        float u_xlat19;
                        u_xlat0.xyz = input.POSITION0.yyy * UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
                        u_xlat0.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat0.xyz);
                        u_xlat0.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat0.xyz);
                        u_xlat0.xyz = u_xlat0.xyz + UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
                        u_xlat18 = u_xlat0.y * VGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
                        u_xlat18 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixV[0].z, u_xlat0.x, u_xlat18);
                        u_xlat18 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixV[2].z, u_xlat0.z, u_xlat18);
                        output.TEXCOORD1 = u_xlat18 + VGlobals.hlslcc_mtx4x4unity_MatrixV[3].z;
                        output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, UnityPerMaterial._BaseMap_ST.xy, UnityPerMaterial._BaseMap_ST.zw);
                        u_xlat1.xyz = (-u_xlat0.xyz) + VGlobals._WorldSpaceCameraPos.xyzx.xyz;
                        u_xlatb18 = VGlobals.unity_OrthoParams.w==0.0;
                        u_xlat2.x = VGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
                        u_xlat2.y = VGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
                        u_xlat2.z = VGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
                        u_xlat1.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat2.xyz;
                        u_xlat16_3.x = dot(u_xlat1.xyz, u_xlat1.xyz);
                        u_xlat16_3.x = rsqrt(u_xlat16_3.x);
                        u_xlat16_3.xyz = half3(u_xlat1.xyz * float3(u_xlat16_3.xxx));
                        u_xlat16_4.xyz = u_xlat16_3.xyz * half3(UnityPerMaterial._OutlineDepthOffset);
                        output.TEXCOORD4.xyz = float3(u_xlat16_3.xyz);
                        u_xlat18 = (-input.COLOR0.y) + 1.0;
                        u_xlat1.xyz = float3(u_xlat18) * float3(u_xlat16_4.xyz);
                        u_xlat1.xyz = fma(u_xlat1.xyz, float3(0.180000007, 0.180000007, 0.180000007), u_xlat0.xyz);
                        output.TEXCOORD2.xyz = u_xlat0.xyz;
                        u_xlat0.xyz = input.TANGENT0.yyy * UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
                        u_xlat0.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.TANGENT0.xxx, u_xlat0.xyz);
                        u_xlat0.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.TANGENT0.zzz, u_xlat0.xyz);
                        u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
                        u_xlat18 = max(u_xlat18, 1.17549435e-38);
                        u_xlat18 = rsqrt(u_xlat18);
                        u_xlat0.xyz = float3(u_xlat18) * u_xlat0.xyz;
                        u_xlat2.x = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
                        u_xlat2.y = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
                        u_xlat2.z = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
                        u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
                        u_xlat18 = max(u_xlat18, 1.17549435e-38);
                        u_xlat18 = rsqrt(u_xlat18);
                        u_xlat2.xyz = float3(u_xlat18) * u_xlat2.xyz;
                        u_xlat5.xyz = u_xlat0.yzx * u_xlat2.zxy;
                        u_xlat5.xyz = fma(u_xlat2.yzx, u_xlat0.zxy, (-u_xlat5.xyz));
                        u_xlatb18 = UnityPerDraw.unity_WorldTransformParams.w>=half(0.0);
                        u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
                        u_xlat16_3.x = half(u_xlat18 * input.TANGENT0.w);
                        u_xlat16_3.xyz = half3(float3(u_xlat16_3.xxx) * u_xlat5.xyz);
                        u_xlat5.xyz = float3(u_xlat16_3.xyz) * input.TEXCOORD3.yyy;
                        u_xlat0.xyz = fma(input.TEXCOORD3.xxx, u_xlat0.xyz, u_xlat5.xyz);
                        u_xlat0.xyz = fma(input.TEXCOORD3.zzz, u_xlat2.xyz, u_xlat0.xyz);
                        output.TEXCOORD3.xyz = u_xlat2.xyz;
                        u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
                        u_xlat18 = rsqrt(u_xlat18);
                        u_xlat0.xyz = float3(u_xlat18) * u_xlat0.xyz;
                        u_xlat0.xyz = u_xlat0.xyz * input.COLOR0.xxx;
                        u_xlat0.xyz = u_xlat0.xyz * float3(UnityPerMaterial._OutlineWidth);
                        u_xlat0.xyz = u_xlat0.xyz * float3(UnityPerMaterial._OutlineScale);
                        u_xlat0.xyz = fma(u_xlat0.xyz, float3(0.00499999989, 0.00499999989, 0.00499999989), u_xlat1.xyz);
                        u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
                        u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
                        u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
                        u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_MatrixVP[3];
                        u_xlat1 = input.POSITION0.yyyy * UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[1];
                        u_xlat1 = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat1);
                        u_xlat1 = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat1);
                        u_xlat1 = u_xlat1 + UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[3];
                        u_xlat2.xyz = u_xlat1.yyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1].xyw;
                        u_xlat2.xyz = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0].xyw, u_xlat1.xxx, u_xlat2.xyz);
                        u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2].xyw, u_xlat1.zzz, u_xlat2.xyz);
                        u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3].xyw, u_xlat1.www, u_xlat1.xyz);
                        u_xlat0.xy = u_xlat0.xy + (-u_xlat1.xy);
                        output.mtl_Position.zw = u_xlat0.zw;
                        u_xlat12.xy = VGlobals._ScreenParams.zw + float2(-1.0, -1.0);
                        u_xlat19 = input.COLOR0.x * float(UnityPerMaterial._OutlineMinPixelSize);
                        u_xlat12.xy = u_xlat12.xy * float2(u_xlat19);
                        u_xlat12.xy = u_xlat1.zz * u_xlat12.xy;
                        u_xlat13.xy = max(u_xlat12.xy, u_xlat0.xy);
                        u_xlat12.xy = min((-u_xlat12.xy), u_xlat0.xy);
                        u_xlatb0.xy = (u_xlat0.xy>=float2(0.0, 0.0));
                        u_xlat0.xy = select(float2(0.0, 0.0), float2(1.0, 1.0), bool2(u_xlatb0.xy));
                        u_xlat13.xy = (-u_xlat12.xy) + u_xlat13.xy;
                        u_xlat0.xy = fma(u_xlat0.xy, u_xlat13.xy, u_xlat12.xy);
                        output.mtl_Position.xy = u_xlat0.xy + u_xlat1.xy;
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
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_FragmentIn
                    {
                        float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    fragment Mtl_FragmentOut xlatMtlMain(
                        constant FGlobals_Type& FGlobals [[ buffer(0) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(1) ]],
                        sampler sampler_OutlineMap [[ sampler (0) ]],
                        texture2d<half, access::sample > _OutlineMap [[ texture(0) ]] ,
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        half4 u_xlat16_0;
                        half4 u_xlat16_1;
                        int u_xlati1;
                        bool u_xlatb1;
                        bool u_xlatb3;
                        half u_xlat16_6;
                        u_xlat16_0 = (-UnityPerMaterial._OutlineColor) + UnityPerMaterial._OutlineColorEnemy;
                        u_xlat16_0 = fma(half4(UnityPerMaterial._EnableEnemy), u_xlat16_0, UnityPerMaterial._OutlineColor);
                        u_xlat16_1 = _OutlineMap.sample(sampler_OutlineMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                        u_xlat16_6 = u_xlat16_0.w * u_xlat16_1.w;
                        output.SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
                        u_xlati1 = int((UnityPerMaterial._DissolveAlpha>=u_xlat16_6) ? 0xFFFFFFFFu : uint(0));
                        u_xlatb3 = u_xlati1==0x0;
                        u_xlat16_0.x = (u_xlati1 != 0) ? half(1.0) : half(0.0);
                        u_xlatb1 = UnityPerMaterial._EnableDissolve==half(1.0);
                        u_xlatb3 = u_xlatb1 && u_xlatb3;
                        output.SV_Target0.w = (u_xlatb1) ? u_xlat16_0.x : u_xlat16_6;
                        if(((int(u_xlatb3) * int(0xffffffffu)))!=0){discard_fragment();}
                        return output;
                    }
                    "
                }
                SubProgram "metal " {
                    Keywords { "_ENABLE_DITHER_BASECOLOR_ALPHA" }
                    "#include <metal_stdlib>
                    #include <metal_texture>
                    using namespace metal;
                    constant float4 ImmCB_0[64] =
                    {
                    	float4(0.5, 0.0, 0.0, 0.0),
                    	float4(48.5, 0.0, 0.0, 0.0),
                    	float4(12.5, 0.0, 0.0, 0.0),
                    	float4(60.5, 0.0, 0.0, 0.0),
                    	float4(3.5, 0.0, 0.0, 0.0),
                    	float4(51.5, 0.0, 0.0, 0.0),
                    	float4(15.5, 0.0, 0.0, 0.0),
                    	float4(63.5, 0.0, 0.0, 0.0),
                    	float4(32.5, 0.0, 0.0, 0.0),
                    	float4(16.5, 0.0, 0.0, 0.0),
                    	float4(44.5, 0.0, 0.0, 0.0),
                    	float4(28.5, 0.0, 0.0, 0.0),
                    	float4(35.5, 0.0, 0.0, 0.0),
                    	float4(19.5, 0.0, 0.0, 0.0),
                    	float4(47.5, 0.0, 0.0, 0.0),
                    	float4(31.5, 0.0, 0.0, 0.0),
                    	float4(8.5, 0.0, 0.0, 0.0),
                    	float4(56.5, 0.0, 0.0, 0.0),
                    	float4(4.5, 0.0, 0.0, 0.0),
                    	float4(52.5, 0.0, 0.0, 0.0),
                    	float4(11.5, 0.0, 0.0, 0.0),
                    	float4(59.5, 0.0, 0.0, 0.0),
                    	float4(7.5, 0.0, 0.0, 0.0),
                    	float4(55.5, 0.0, 0.0, 0.0),
                    	float4(40.5, 0.0, 0.0, 0.0),
                    	float4(24.5, 0.0, 0.0, 0.0),
                    	float4(36.5, 0.0, 0.0, 0.0),
                    	float4(20.5, 0.0, 0.0, 0.0),
                    	float4(43.5, 0.0, 0.0, 0.0),
                    	float4(27.5, 0.0, 0.0, 0.0),
                    	float4(39.5, 0.0, 0.0, 0.0),
                    	float4(23.5, 0.0, 0.0, 0.0),
                    	float4(2.5, 0.0, 0.0, 0.0),
                    	float4(50.5, 0.0, 0.0, 0.0),
                    	float4(14.5, 0.0, 0.0, 0.0),
                    	float4(62.5, 0.0, 0.0, 0.0),
                    	float4(1.5, 0.0, 0.0, 0.0),
                    	float4(49.5, 0.0, 0.0, 0.0),
                    	float4(13.5, 0.0, 0.0, 0.0),
                    	float4(61.5, 0.0, 0.0, 0.0),
                    	float4(34.5, 0.0, 0.0, 0.0),
                    	float4(18.5, 0.0, 0.0, 0.0),
                    	float4(46.5, 0.0, 0.0, 0.0),
                    	float4(30.5, 0.0, 0.0, 0.0),
                    	float4(33.5, 0.0, 0.0, 0.0),
                    	float4(17.5, 0.0, 0.0, 0.0),
                    	float4(45.5, 0.0, 0.0, 0.0),
                    	float4(29.5, 0.0, 0.0, 0.0),
                    	float4(10.5, 0.0, 0.0, 0.0),
                    	float4(58.5, 0.0, 0.0, 0.0),
                    	float4(6.5, 0.0, 0.0, 0.0),
                    	float4(54.5, 0.0, 0.0, 0.0),
                    	float4(9.5, 0.0, 0.0, 0.0),
                    	float4(57.5, 0.0, 0.0, 0.0),
                    	float4(5.5, 0.0, 0.0, 0.0),
                    	float4(53.5, 0.0, 0.0, 0.0),
                    	float4(42.5, 0.0, 0.0, 0.0),
                    	float4(26.5, 0.0, 0.0, 0.0),
                    	float4(38.5, 0.0, 0.0, 0.0),
                    	float4(22.5, 0.0, 0.0, 0.0),
                    	float4(41.5, 0.0, 0.0, 0.0),
                    	float4(25.5, 0.0, 0.0, 0.0),
                    	float4(37.5, 0.0, 0.0, 0.0),
                    	float4(21.5, 0.0, 0.0, 0.0)
                    };
                    #ifndef XLT_REMAP_O
                    	#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
                    #endif
                    constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
                    struct FGlobals_Type
                    {
                        float4 _ScreenParams;
                        float2 _GlobalMipBias;
                    };
                    
                    struct UnityPerMaterial_Type
                    {
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_FragmentIn
                    {
                        float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    		template <typename UVecType> UVecType bitFieldInsert(const UVecType width, const UVecType offset, const UVecType src2, const UVecType src3)
                    		{
                    			UVecType bitmask = (((UVecType(1) << width)-1) << offset) & 0xffffffff;
                    			return ((src2 << offset) & bitmask) | (src3 & ~bitmask);
                    		}; 
                    fragment Mtl_FragmentOut xlatMtlMain(
                        constant FGlobals_Type& FGlobals [[ buffer(0) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(1) ]],
                        sampler sampler_OutlineMap [[ sampler (0) ]],
                        texture2d<half, access::sample > _OutlineMap [[ texture(0) ]] ,
                        float4 mtl_FragCoord [[ position ]],
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        float4 hlslcc_FragCoord = float4(mtl_FragCoord.xyz, 1.0/mtl_FragCoord.w);
                        float2 u_xlat0;
                        int u_xlati0;
                        uint2 u_xlatu0;
                        bool u_xlatb0;
                        half4 u_xlat16_1;
                        half4 u_xlat16_2;
                        bool u_xlatb3;
                        half u_xlat16_10;
                        u_xlat0.xy = FGlobals._ScreenParams.zw + float2(-1.0, -1.0);
                        u_xlat0.xy = u_xlat0.xy * hlslcc_FragCoord.xy;
                        u_xlat0.xy = u_xlat0.xy * FGlobals._ScreenParams.xy;
                        u_xlatu0.xy = uint2(u_xlat0.xy);
                        u_xlati0 = int(bitFieldInsert(0x3u, 0x3u, u_xlatu0.x, 0x0u));
                        u_xlati0 = int(bitFieldInsert(0x3u, 0x0u, u_xlatu0.y, uint(u_xlati0)));
                        u_xlat0.x = 0.015625 * ImmCB_0[u_xlati0].x;
                        u_xlat16_1 = (-UnityPerMaterial._OutlineColor) + UnityPerMaterial._OutlineColorEnemy;
                        u_xlat16_1 = fma(half4(UnityPerMaterial._EnableEnemy), u_xlat16_1, UnityPerMaterial._OutlineColor);
                        u_xlat16_2 = _OutlineMap.sample(sampler_OutlineMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                        u_xlat16_10 = u_xlat16_1.w * u_xlat16_2.w;
                        output.SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
                        u_xlat0.x = fma(float(u_xlat16_10), float(UnityPerMaterial._BaseColor.w), (-u_xlat0.x));
                        u_xlatb0 = u_xlat0.x<0.0;
                        if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard_fragment();}
                        u_xlati0 = int((UnityPerMaterial._DissolveAlpha>=u_xlat16_10) ? 0xFFFFFFFFu : uint(0));
                        u_xlatb3 = u_xlati0==0x0;
                        u_xlat16_1.x = (u_xlati0 != 0) ? half(1.0) : half(0.0);
                        u_xlatb0 = UnityPerMaterial._EnableDissolve==half(1.0);
                        u_xlatb3 = u_xlatb0 && u_xlatb3;
                        output.SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_10;
                        if(((int(u_xlatb3) * int(0xffffffffu)))!=0){discard_fragment();}
                        return output;
                    }
                    "
                }
            }
        }
        Pass {
            Name "OutlineBuffers"
            LOD 300
            Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "OutlineBuffers" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "4.5" "UniversalMaterialType" = "SimpleLit" }
            Cull Off
            GpuProgramID 163149
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
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_VertexIn
                    {
                        float4 POSITION0 [[ attribute(0) ]] ;
                        float2 TEXCOORD0 [[ attribute(1) ]] ;
                        float3 NORMAL0 [[ attribute(2) ]] ;
                        half4 COLOR0 [[ attribute(3) ]] ;
                    };
                    
                    struct Mtl_VertexOut
                    {
                        float4 mtl_Position [[ position, invariant ]];
                        float2 TEXCOORD1 [[ user(TEXCOORD1) ]];
                        half4 COLOR0 [[ user(COLOR0) ]];
                        half3 TEXCOORD2 [[ user(TEXCOORD2) ]];
                        half3 TEXCOORD3 [[ user(TEXCOORD3) ]];
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
                        u_xlat0 = input.POSITION0.yyyy * UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[1];
                        u_xlat0 = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
                        u_xlat0 = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
                        u_xlat0 = u_xlat0 + UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[3];
                        u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
                        u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
                        u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
                        output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
                        output.TEXCOORD1.xy = fma(input.TEXCOORD0.xy, UnityPerMaterial._BaseMap_ST.xy, UnityPerMaterial._BaseMap_ST.zw);
                        output.COLOR0 = input.COLOR0;
                        u_xlat0.x = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
                        u_xlat0.y = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
                        u_xlat0.z = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
                        u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
                        u_xlat6 = max(u_xlat6, 1.17549435e-38);
                        u_xlat6 = rsqrt(u_xlat6);
                        u_xlat0.xyz = float3(u_xlat6) * u_xlat0.xyz;
                        u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
                        u_xlat6 = rsqrt(u_xlat6);
                        u_xlat0.xyz = float3(u_xlat6) * u_xlat0.xyz;
                        output.TEXCOORD2.xyz = half3(u_xlat0.xyz);
                        output.TEXCOORD3.xyz = half3(0.0, 0.0, 0.0);
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
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_FragmentIn
                    {
                        float2 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
                        half4 COLOR0 [[ user(COLOR0) ]] ;
                        half3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        float4 SV_TARGET0 [[ color(xlt_remap_o[0]) ]];
                        float4 SV_TARGET1 [[ color(xlt_remap_o[1]) ]];
                    };
                    
                    fragment Mtl_FragmentOut xlatMtlMain(
                        constant FGlobals_Type& FGlobals [[ buffer(0) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(1) ]],
                        sampler sampler_OutlineMap [[ sampler (0) ]],
                        sampler sampler_RimMaskMap [[ sampler (1) ]],
                        texture2d<half, access::sample > _OutlineMap [[ texture(0) ]] ,
                        texture2d<half, access::sample > _RimMaskMap [[ texture(1) ]] ,
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        float u_xlat0;
                        half4 u_xlat16_0;
                        bool u_xlatb0;
                        half4 u_xlat16_1;
                        half3 u_xlat16_2;
                        float u_xlat3;
                        bool u_xlatb3;
                        float u_xlat6;
                        u_xlatb0 = UnityPerMaterial._EnableDissolve==half(1.0);
                        u_xlat16_1 = _OutlineMap.sample(sampler_OutlineMap, input.TEXCOORD1.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                        u_xlatb3 = UnityPerMaterial._DissolveAlpha>=u_xlat16_1.w;
                        u_xlat16_2.x = (u_xlatb3) ? half(1.0) : half(0.0);
                        u_xlat3 = float(_RimMaskMap.sample(sampler_RimMaskMap, input.TEXCOORD1.xy, bias(FGlobals._GlobalMipBias.xyxx.x)).y);
                        u_xlat6 = float(u_xlat16_2.x) * u_xlat3;
                        output.SV_TARGET0.w = (u_xlatb0) ? u_xlat6 : u_xlat3;
                        u_xlat0 = dot(input.TEXCOORD2.xyz, input.TEXCOORD2.xyz);
                        u_xlat0 = rsqrt(u_xlat0);
                        output.SV_TARGET0.xyz = float3(u_xlat0) * float3(input.TEXCOORD2.xyz);
                        u_xlat16_2.xyz = (-UnityPerMaterial._OutlineColor.xyz) + UnityPerMaterial._OutlineColorEnemy.xyz;
                        u_xlat16_2.xyz = fma(half3(UnityPerMaterial._EnableEnemy), u_xlat16_2.xyz, UnityPerMaterial._OutlineColor.xyz);
                        u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
                        u_xlat16_0.w = input.COLOR0.z;
                        output.SV_TARGET1 = float4(u_xlat16_0);
                        return output;
                    }
                    "
                }
            }
        }
        Pass {
            Name "ShadowCaster"
            LOD 300
            Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "SHADOWCASTER" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "4.5" "UniversalMaterialType" = "SimpleLit" }
            ColorMask 0 0
            Cull Off
            GpuProgramID 201942
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
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_VertexIn
                    {
                        float4 POSITION0 [[ attribute(0) ]] ;
                        float3 NORMAL0 [[ attribute(1) ]] ;
                        float2 TEXCOORD0 [[ attribute(2) ]] ;
                    };
                    
                    struct Mtl_VertexOut
                    {
                        float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
                        float4 mtl_Position [[ position, invariant ]];
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
                        output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, UnityPerMaterial._BaseMap_ST.xy, UnityPerMaterial._BaseMap_ST.zw);
                        u_xlat0.xyz = input.POSITION0.yyy * UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
                        u_xlat0.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat0.xyz);
                        u_xlat0.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat0.xyz);
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
                        u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
                        u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
                        u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
                        u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_MatrixVP[3];
                        output.mtl_Position.z = min(u_xlat0.z, 1.0);
                        output.mtl_Position.xyw = u_xlat0.xyw;
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
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_FragmentIn
                    {
                        float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        half4 SV_TARGET0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    fragment Mtl_FragmentOut xlatMtlMain(
                        constant FGlobals_Type& FGlobals [[ buffer(0) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(1) ]],
                        sampler sampler_BaseMap [[ sampler (0) ]],
                        texture2d<half, access::sample > _BaseMap [[ texture(0) ]] ,
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        float u_xlat0;
                        half u_xlat16_0;
                        int u_xlati0;
                        bool u_xlatb0;
                        half u_xlat16_1;
                        float u_xlat2;
                        int u_xlati2;
                        u_xlatb0 = UnityPerMaterial._EnableDissolve==half(1.0);
                        if(u_xlatb0){
                            u_xlat0 = float(_BaseMap.sample(sampler_BaseMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x)).w);
                            u_xlatb0 = float(UnityPerMaterial._DissolveAlpha)>=u_xlat0;
                            u_xlat2 = float(UnityPerMaterial._BaseColor.w) + -0.5;
                            u_xlati2 = int((u_xlat2<0.0) ? 0xFFFFFFFFu : uint(0));
                            u_xlati0 = (u_xlatb0) ? u_xlati2 : int(0xffffffffu);
                            if((u_xlati0)!=0){discard_fragment();}
                        } else {
                            u_xlat16_0 = _BaseMap.sample(sampler_BaseMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x)).w;
                            u_xlat16_1 = fma(u_xlat16_0, UnityPerMaterial._BaseColor.w, (-UnityPerMaterial._Cutoff));
                            u_xlatb0 = u_xlat16_1<half(0.0);
                            if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard_fragment();}
                        }
                        output.SV_TARGET0 = half4(0.0, 0.0, 0.0, 0.0);
                        return output;
                    }
                    "
                }
            }
        }
        Pass {
            Name "DepthOnly"
            LOD 300
            Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "DepthOnly" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "4.5" "UniversalMaterialType" = "SimpleLit" }
            ColorMask 0 0
            Cull Off
            GpuProgramID 366585
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
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_VertexIn
                    {
                        float4 POSITION0 [[ attribute(0) ]] ;
                        float2 TEXCOORD0 [[ attribute(1) ]] ;
                    };
                    
                    struct Mtl_VertexOut
                    {
                        float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
                        float4 mtl_Position [[ position, invariant ]];
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
                        output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, UnityPerMaterial._BaseMap_ST.xy, UnityPerMaterial._BaseMap_ST.zw);
                        u_xlat0 = input.POSITION0.yyyy * UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[1];
                        u_xlat0 = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
                        u_xlat0 = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
                        u_xlat0 = u_xlat0 + UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[3];
                        u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
                        u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
                        u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
                        output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
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
            }
        }
        Pass {
            Name "DepthNormals"
            LOD 300
            Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "DepthNormals" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "4.5" "UniversalMaterialType" = "SimpleLit" }
            Cull Off
            GpuProgramID 405248
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
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_VertexIn
                    {
                        float4 POSITION0 [[ attribute(0) ]] ;
                        float2 TEXCOORD0 [[ attribute(1) ]] ;
                        float3 NORMAL0 [[ attribute(2) ]] ;
                    };
                    
                    struct Mtl_VertexOut
                    {
                        float4 mtl_Position [[ position, invariant ]];
                        float2 TEXCOORD1 [[ user(TEXCOORD1) ]];
                        half3 TEXCOORD2 [[ user(TEXCOORD2) ]];
                        half3 TEXCOORD3 [[ user(TEXCOORD3) ]];
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
                        u_xlat0 = input.POSITION0.yyyy * UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[1];
                        u_xlat0 = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
                        u_xlat0 = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
                        u_xlat0 = u_xlat0 + UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[3];
                        u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
                        u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
                        u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
                        output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
                        output.TEXCOORD1.xy = fma(input.TEXCOORD0.xy, UnityPerMaterial._BaseMap_ST.xy, UnityPerMaterial._BaseMap_ST.zw);
                        u_xlat0.x = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
                        u_xlat0.y = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
                        u_xlat0.z = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
                        u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
                        u_xlat6 = max(u_xlat6, 1.17549435e-38);
                        u_xlat6 = rsqrt(u_xlat6);
                        u_xlat0.xyz = float3(u_xlat6) * u_xlat0.xyz;
                        u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
                        u_xlat6 = rsqrt(u_xlat6);
                        u_xlat0.xyz = float3(u_xlat6) * u_xlat0.xyz;
                        output.TEXCOORD2.xyz = half3(u_xlat0.xyz);
                        output.TEXCOORD3.xyz = half3(0.0, 0.0, 0.0);
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
                        half3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        half4 SV_TARGET0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    fragment Mtl_FragmentOut xlatMtlMain(
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        half u_xlat16_0;
                        u_xlat16_0 = dot(input.TEXCOORD2.xyz, input.TEXCOORD2.xyz);
                        u_xlat16_0 = rsqrt(u_xlat16_0);
                        output.SV_TARGET0.xyz = half3(u_xlat16_0) * input.TEXCOORD2.xyz;
                        output.SV_TARGET0.w = half(0.0);
                        return output;
                    }
                    "
                }
            }
        }
        Pass {
            Name "Universal2D"
            LOD 300
            Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "Universal2D" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" "ShaderModel" = "4.5" "UniversalMaterialType" = "SimpleLit" }
            GpuProgramID 557546
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
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_VertexIn
                    {
                        float4 POSITION0 [[ attribute(0) ]] ;
                        float2 TEXCOORD0 [[ attribute(1) ]] ;
                    };
                    
                    struct Mtl_VertexOut
                    {
                        float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
                        float4 mtl_Position [[ position, invariant ]];
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
                        output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, UnityPerMaterial._BaseMap_ST.xy, UnityPerMaterial._BaseMap_ST.zw);
                        u_xlat0.xyz = input.POSITION0.yyy * UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
                        u_xlat0.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat0.xyz);
                        u_xlat0.xyz = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat0.xyz);
                        u_xlat0.xyz = u_xlat0.xyz + UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
                        u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
                        u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
                        u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
                        output.mtl_Position = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_MatrixVP[3];
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
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_FragmentIn
                    {
                        float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        half4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
                    };
                    
                    fragment Mtl_FragmentOut xlatMtlMain(
                        constant FGlobals_Type& FGlobals [[ buffer(0) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(1) ]],
                        sampler sampler_BaseMap [[ sampler (0) ]],
                        texture2d<half, access::sample > _BaseMap [[ texture(0) ]] ,
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        half4 u_xlat16_0;
                        u_xlat16_0 = _BaseMap.sample(sampler_BaseMap, input.TEXCOORD0.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                        output.SV_Target0 = u_xlat16_0 * UnityPerMaterial._BaseColor;
                        return output;
                    }
                    "
                }
            }
        }
    }
    SubShader {
        LOD 300
        Tags { "IGNOREPROJECTOR" = "true" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "2.0" "UniversalMaterialType" = "SimpleLit" }
        Pass {
            Name "ForwardLit"
            LOD 300
            Tags { "IGNOREPROJECTOR" = "true" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "2.0" "UniversalMaterialType" = "SimpleLit" }
            Blend Zero Zero, Zero Zero
            ZWrite Off
            Cull Off
            GpuProgramID 608315
        }
        Pass {
            Name "InvertedHullOutline"
            LOD 300
            Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "InvertedHullOutline" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "2.0" "UniversalMaterialType" = "SimpleLit" }
            Cull Front
            GpuProgramID 720563
        }
        Pass {
            Name "OutlineBuffers"
            LOD 300
            Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "OutlineBuffers" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "2.0" "UniversalMaterialType" = "SimpleLit" }
            Cull Off
            GpuProgramID 763101
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
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_VertexIn
                    {
                        float4 POSITION0 [[ attribute(0) ]] ;
                        float2 TEXCOORD0 [[ attribute(1) ]] ;
                        float3 NORMAL0 [[ attribute(2) ]] ;
                        half4 COLOR0 [[ attribute(3) ]] ;
                    };
                    
                    struct Mtl_VertexOut
                    {
                        float4 mtl_Position [[ position, invariant ]];
                        float2 TEXCOORD1 [[ user(TEXCOORD1) ]];
                        half4 COLOR0 [[ user(COLOR0) ]];
                        half3 TEXCOORD2 [[ user(TEXCOORD2) ]];
                        half3 TEXCOORD3 [[ user(TEXCOORD3) ]];
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
                        u_xlat0 = input.POSITION0.yyyy * UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[1];
                        u_xlat0 = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
                        u_xlat0 = fma(UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
                        u_xlat0 = u_xlat0 + UnityPerDraw.hlslcc_mtx4x4unity_ObjectToWorld[3];
                        u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
                        u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
                        u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
                        output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
                        output.TEXCOORD1.xy = fma(input.TEXCOORD0.xy, UnityPerMaterial._BaseMap_ST.xy, UnityPerMaterial._BaseMap_ST.zw);
                        output.COLOR0 = input.COLOR0;
                        u_xlat0.x = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
                        u_xlat0.y = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
                        u_xlat0.z = dot(input.NORMAL0.xyz, UnityPerDraw.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
                        u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
                        u_xlat6 = max(u_xlat6, 1.17549435e-38);
                        u_xlat6 = rsqrt(u_xlat6);
                        u_xlat0.xyz = float3(u_xlat6) * u_xlat0.xyz;
                        u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
                        u_xlat6 = rsqrt(u_xlat6);
                        u_xlat0.xyz = float3(u_xlat6) * u_xlat0.xyz;
                        output.TEXCOORD2.xyz = half3(u_xlat0.xyz);
                        output.TEXCOORD3.xyz = half3(0.0, 0.0, 0.0);
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
                        float4 _BaseMap_ST;
                        float4 _OutlineMap_ST;
                        float4 _RimMaskMap_ST;
                        float4 _BaseMapEnemy_ST;
                        half4 _BaseColor;
                        half4 _SubColor;
                        half4 _RimColor;
                        half4 _RimVector;
                        half4 _OutlineColor;
                        half4 _SpecColor;
                        half4 _EmissionColor;
                        half4 _OutlineColorEnemy;
                        half4 _EffectColor;
                        half4 _EffectColorEnemy;
                        half _DepthOffset;
                        half _RimWidth;
                        half _RimBoaderSmooth;
                        half _RimBaseColorCurve;
                        half _OutlineWidth;
                        half _OutlineScale;
                        half _OutlineDepthOffset;
                        half _OutlineMinPixelSize;
                        half _Cutoff;
                        half _Surface;
                        half _EnableEnemy;
                        half _EnableEffect;
                        half _EffectDistortionIntensity;
                        half _EffectSpeedU;
                        half _EffectSpeedV;
                        half _EnableDissolve;
                        half _DissolveAlpha;
                    };
                    
                    struct Mtl_FragmentIn
                    {
                        float2 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
                        half4 COLOR0 [[ user(COLOR0) ]] ;
                        half3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
                    };
                    
                    struct Mtl_FragmentOut
                    {
                        float4 SV_TARGET0 [[ color(xlt_remap_o[0]) ]];
                        float4 SV_TARGET1 [[ color(xlt_remap_o[1]) ]];
                    };
                    
                    fragment Mtl_FragmentOut xlatMtlMain(
                        constant FGlobals_Type& FGlobals [[ buffer(0) ]],
                        constant UnityPerMaterial_Type& UnityPerMaterial [[ buffer(1) ]],
                        sampler sampler_OutlineMap [[ sampler (0) ]],
                        sampler sampler_RimMaskMap [[ sampler (1) ]],
                        texture2d<half, access::sample > _OutlineMap [[ texture(0) ]] ,
                        texture2d<half, access::sample > _RimMaskMap [[ texture(1) ]] ,
                        Mtl_FragmentIn input [[ stage_in ]])
                    {
                        Mtl_FragmentOut output;
                        float u_xlat0;
                        half4 u_xlat16_0;
                        bool u_xlatb0;
                        half4 u_xlat16_1;
                        half3 u_xlat16_2;
                        float u_xlat3;
                        bool u_xlatb3;
                        float u_xlat6;
                        u_xlatb0 = UnityPerMaterial._EnableDissolve==half(1.0);
                        u_xlat16_1 = _OutlineMap.sample(sampler_OutlineMap, input.TEXCOORD1.xy, bias(FGlobals._GlobalMipBias.xyxx.x));
                        u_xlatb3 = UnityPerMaterial._DissolveAlpha>=u_xlat16_1.w;
                        u_xlat16_2.x = (u_xlatb3) ? half(1.0) : half(0.0);
                        u_xlat3 = float(_RimMaskMap.sample(sampler_RimMaskMap, input.TEXCOORD1.xy, bias(FGlobals._GlobalMipBias.xyxx.x)).y);
                        u_xlat6 = float(u_xlat16_2.x) * u_xlat3;
                        output.SV_TARGET0.w = (u_xlatb0) ? u_xlat6 : u_xlat3;
                        u_xlat0 = dot(input.TEXCOORD2.xyz, input.TEXCOORD2.xyz);
                        u_xlat0 = rsqrt(u_xlat0);
                        output.SV_TARGET0.xyz = float3(u_xlat0) * float3(input.TEXCOORD2.xyz);
                        u_xlat16_2.xyz = (-UnityPerMaterial._OutlineColor.xyz) + UnityPerMaterial._OutlineColorEnemy.xyz;
                        u_xlat16_2.xyz = fma(half3(UnityPerMaterial._EnableEnemy), u_xlat16_2.xyz, UnityPerMaterial._OutlineColor.xyz);
                        u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
                        u_xlat16_0.w = input.COLOR0.z;
                        output.SV_TARGET1 = float4(u_xlat16_0);
                        return output;
                    }
                    "
                }
            }
        }
        Pass {
            Name "ShadowCaster"
            LOD 300
            Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "SHADOWCASTER" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "2.0" "UniversalMaterialType" = "SimpleLit" }
            ColorMask 0 0
            Cull Off
            GpuProgramID 829537
        }
        Pass {
            Name "DepthOnly"
            LOD 300
            Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "DepthOnly" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "2.0" "UniversalMaterialType" = "SimpleLit" }
            ColorMask 0 0
            Cull Off
            GpuProgramID 890296
        }
        Pass {
            Name "DepthNormals"
            LOD 300
            Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "DepthNormals" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Opaque" "ShaderModel" = "2.0" "UniversalMaterialType" = "SimpleLit" }
            Cull Off
            GpuProgramID 929104
        }
        Pass {
            Name "Universal2D"
            LOD 300
            Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "Universal2D" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" "ShaderModel" = "2.0" "UniversalMaterialType" = "SimpleLit" }
            GpuProgramID 1102879
        }
    }
Fallback "Hidden/Universal Render Pipeline/FallbackError"
}