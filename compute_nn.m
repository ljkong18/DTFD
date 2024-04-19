function dist = compute_nn(feature,query_feature,type)
%CALCULATE_MAP �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    switch type
        case {1,'L1'}
            dist = sum(abs(feature - query_feature),2);
        case {2,'L2'}
            dist = pdist2(feature,query_feature,'squaredeuclidean');
       
    end
        
end