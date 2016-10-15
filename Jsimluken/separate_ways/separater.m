function res = separater(org,src,dst)
    [maxSrc,mIndexSrc] = max(src);
    [maxDst,mIndexDst] = max(dst);
    syms u v;
    S = solve([u*src(mIndexSrc)+v*dst(mIndexSrc)==org(mIndexSrc),u*src(mIndexDst)+v*dst(mIndexDst)==org(mIndexDst)],[u,v]);
    u = double(S.u);
    v = double(S.v);
    res = (org - u*src)/v;
    return
