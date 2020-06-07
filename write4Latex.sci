function write4Latex(A,name)
    //This function is able to write an nx2 matrix to a .csv file so it can be
    //used in Latex for making data plots.
    //
    //Input A: nx2 matrix that represents the data
    //Input name: string that will be the name of the outputfile
    //
    // 16-07-2019 D.A. Snoeken
    if argn(2)~=2 then
        mprintf('Example: write4Latex(Matrix,outname)\n')
        error('Need nx2 matrix and string as input.')
    end
    if size(A,2)~=2 then
        error('Input must be nx2 matrix.')
    end
    name=string(name);
    while(isfile(name+'.csv'))
        mprintf('WARNING! File %s.csv already exists!\n',name)
        x = input('Overwrite? (yes/no) ','string');
        if(x=='yes')
            mprintf('Overwriting %s.csv!',name)
            break;
        else
            x=input('Give a new name: ','string');
            name=x;
        end
    end
    mprintf('output written to ./%s.csv',name);
    fd=mopen(msprintf('./%s.csv',name),'w');
    mclose(fd);
    fid=mopen(msprintf('./%s.csv',name),'a');
    mfprintf(fid,'x,y\n');
    for i=1:size(A,1)
        mfprintf(fid,'%.5f,%.15f\n',[A(i,1) A(i,2)]);
    end
    mclose(fid);
endfunction
