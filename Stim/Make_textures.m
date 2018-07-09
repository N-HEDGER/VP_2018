
clist=linspace(10,100,10);

% Fear faces



for i=1:length(clist)
    for m=1:length(fups)
        upp = newimage(fups{m},clist(i));
        Ftype{1,m,i} = Screen('MakeTexture', w, upp);
    end
end



for i=1:length(clist);
    for m=1:length(fips)
        upp= newimage(fips{m},clist(i));
        
        Ftype{2,m,i}= Screen('MakeTexture', w, upp);
    end
    
end



for i=1:length(clist);
    for m=1:length(hups)
        upp= newimage(hups{m},clist(i));
        
        Htype{1,m,i}= Screen('MakeTexture', w, upp);
    end
    
end




for i=1:length(clist);
    for m=1:length(hips)
        
        upp = newimage(hips{m},clist(i));
        
        Htype{2,m,i}= Screen('MakeTexture', w, upp);
    end
    
end





for i=1:length(clist);
    for m=1:length(nups)
        
        upp= newimage(nups{m},clist(i));
        
        Ntype{1,m,i}= Screen('MakeTexture', w, upp);
    end
    
end




for i=1:length(clist);
    for m=1:length(nips)
        
        upp= newimage(nips{m},clist(i));
        
        Ntype{2,m,i}= Screen('MakeTexture', w, upp);
    end
    
end




masks2=cell(1,length(masks))

for i=1:length(masks)
    masks2{i}=Screen('MakeTexture',w,masks{i});
end

