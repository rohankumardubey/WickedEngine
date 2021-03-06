#define OBJECTSHADER_LAYOUT_SHADOW_TEX
#include "objectHF.hlsli"
#include "ShaderInterop_Renderer.h"

[earlydepthstencil]
float4 main(PixelInput PSIn) : SV_TARGET
{
	const float2 pixel = (xPaintRadUVSET == 0 ? PSIn.uvsets.xy : PSIn.uvsets.zw) * xPaintRadResolution;
	const float dist = distance(pixel, xPaintRadCenter);
	float circle = dist - xPaintRadRadius;
	float3 color = circle < 0 ? float3(0, 0, 0) : float3(1, 1, 1);
	float alpha = 1 - saturate(abs(circle) * 0.25f);

	return float4(color, alpha);
}
