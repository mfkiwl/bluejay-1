//==============================================
// advance_high_performance_bus__slave
//==============================================
module advance_high_performance_bus__slave
(
    input hclk,
    input hresetn,
    input hsel,
    input [39:0] haddr,
    input hwrite,
    input [2:0] hsize,
    input [2:0] hburst,
    input [3:0] hprot,
    input [1:0] htrans,
    input hmastlock,
    input [63:0] hwdata,
    input hready,
    output logic hresp,
    output logic hreadyout,
    output logic [63:0] hrdata,
    output logic ahb_slave_to_device__valid,
    input ahb_slave_to_device__ready,
    output logic ahb_slave_to_device__we,
    output logic [39:0] ahb_slave_to_device__addr,
    output logic [2:0] ahb_slave_to_device__dtype,
    output logic [63:0] ahb_slave_to_device__wr_data,
    input ahb_slave_to_device__error,
    input ahb_slave_to_device__rd_data
);





logic [3:0] state;
logic [3:0] state__n;


always_comb
begin
    case (state)
        
        //==============================
        // STATE__IDLE
        //==============================
        STATE__IDLE:
        begin
            hreadyout = 1'b1;
            hresp = 1'b0;
            state__n = en ? STATE__RESP : STATE__IDLE;
        end

        //==============================
        // STATE__RESP
        //==============================
        STATE__RESP:
        begin
            ahb_slave_to_device__valid = 1'b1;
            hreadyout = (ahb_slave_to_device__ready & ~ahb_slave_to_device__error); 
            hresp = (ahb_slave_to_device__ready & ahb_slave_to_device__error); 
            state__n = (ahb_slave_to_device__ready & ahb_slave_to_device__error) ? STATE__ERROR : en ? STATE__RESP : STATE__IDLE; 
        end

        //==============================
        // STATE__ERROR
        //==============================
        STATE__ERROR:
        begin
            hreadyout = 1'b1;
            hresp = 1'b1;
            state__n = en ? STATE__RESP : STATE__IDLE;
        end

    endcase
end




always_comb
begin
    case (state)
        //==============================
        // STATE__IDLE
        //==============================
        STATE__IDLE:
        begin
            alway_comb
            begin
                case (htrans)
                    AHB__HTRANS__IDLE:
                    begin
                        next_state = STATE__IDLE;
                    end
                    AHB__HTRANS__BUSY:
                    begin
                        next_state = STATE__FATAL;
                    end
                    AHB__HTRANS__NONSEQ:
                    begin
                        case (hburst)
                            AHB__HBURST__SINGLE:
                            begin
                                next_state = hsel ? STATE__SINGLE : STATE__IDLE;
                            end
                            AHB__HBURST__INCR:
                            begin
                                next_state = STATE__FATAL;
                            end
                            AHB__HBURST__WRAP4:
                            begin
                                next_state = STATE__FATAL;
                            end
                            AHB__HBURST__INCR4:
                            begin
                                next_state = STATE__FATAL;
                            end
                            AHB__HBURST__WRAP8:
                            begin
                                next_state = STATE__FATAL;
                            end
                            AHB__HBURST__INCR8:
                            begin
                                next_state = STATE__FATAL;
                            end
                            AHB__HBURST__WRAP16:
                            begin
                                next_state = STATE__FATAL;
                            end
                            AHB__HBURST__INCR16:
                            begin
                                next_state = STATE__FATAL;
                            end
                        endcase
                    end
                    AHB__HTRANS__SEQ:
                    begin
                        next_state = STATE__FATAL;
                    end
                endcase
end
        end

        //==============================
        // STATE__SINGLE
        //==============================
        STATE__SINGLE:
        begin
        end

        //==============================
        // STATE__INCR
        //==============================
        STATE__INCR:
        begin
        end
    endcase
end


alway_comb
begin
    case (htrans)
        AHB__HTRANS__IDLE:
        begin
            en = 1'b0;
        end
        AHB__HTRANS__BUSY:
        begin
            en = 1'b0;
        end
        AHB__HTRANS__NONSEQ:
        begin
            en = hready & hsel;
        end
        AHB__HTRANS__SEQ:
        begin
            en = hready & hsel;
        end
    endcase
end


alway_comb
begin
    case (htrans)
        AHB__HTRANS__IDLE:
        begin
            en = 1'b0;
        end
        AHB__HTRANS__BUSY:
        begin
            en = 1'b0;
        end
        AHB__HTRANS__NONSEQ:
        begin
            case (hburst)
                AHB__HBURST__SINGLE:
                begin
                    en = hready & hsel;
                end
                AHB__HBURST__INCR:
                begin
                    en = hready & hsel;
                end
                AHB__HBURST__WRAP4:
                begin
                    en = hready & hsel;
                end
                AHB__HBURST__INCR4:
                begin
                    en = hready & hsel;
                end
                AHB__HBURST__WRAP8:
                begin
                    next_state = STATE__FATAL;
                end
                AHB__HBURST__INCR8:
                begin
                    next_state = STATE__FATAL;
                end
                AHB__HBURST__WRAP16:
                begin
                    next_state = STATE__FATAL;
                end
                AHB__HBURST__INCR16:
                begin
                    next_state = STATE__FATAL;
                end
            endcase
        end
        AHB__HTRANS__SEQ:
        begin
            next_state = STATE__FATAL;
        end
    endcase
end




assign sample = hready & hsel & (htrans == AHB__HTRANS__NONSEQ) || (htrans == AHB__HTRANS__SEQ);







always_comb
begin
    case (htrans)
        AHB__HTRANS__IDLE:
        begin
        end
        AHB__HTRANS__BUSY:
        begin
        end
        AHB__HTRANS__NONSEQ:
        begin
        end
        AHB__HTRANS__SEQ:
        begin
        end
    endcase
end

always_comb 
begin
    hresp = 1'b0;
    hreadyout = 1'b1;
    ce = 1'b0;
    state__n = state;
        
    case (state)

        //==============================
        // STATE__RESET
        //==============================
        STATE__RESET:
        begin
            state__n = STATE__IDLE;
        end


        //==============================
        // STATE__IDLE
        //==============================
        STATE__IDLE:
        begin
            hresp = 1'b0;
            hreadyout = 1'b1; 
            
            case (htrans)
                AHB__HTRANS__IDLE:
                begin
                    state__n = STATE__IDLE;
                end
                AHB__HTRANS__BUSY:
                begin
                    state__n = STATE__IDLE; 
                end
                AHB__HTRANS__NONSEQ:
                begin
                    state__n = hready & hsel ? STATE__ACTIVE : STATE__IDLE;
                end
                AHB__HTRANS__SEQ:
                begin
                    state__n = STATE__IDLE; 
                end
            endcase
        end


        //==============================
        // STATE__ACTIVE
        //==============================
        STATE__ACTIVE:
        begin
            hresp = 1'b0;
            hreadyout = 1'b1; 
            ce = 1'b1;
            
            case (htrans)
                AHB__HTRANS__IDLE:
                begin
                    state__n = STATE__IDLE;
                end
                AHB__HTRANS__BUSY:
                begin
                    state__n = STATE__ACTIVE; 
                end
                AHB__HTRANS__NONSEQ:
                begin
                    state__n = hready & hsel ? STATE__ACTIVE : STATE__IDLE;
                end
                AHB__HTRANS__SEQ:
                begin
                    state__n = STATE__ACTIVE; 
                end
            endcase
        end



        //==============================
        // STATE__IDLE
        //==============================
        STATE__IDLE:
        begin
            case (htrans)
                AHB__HTRANS__IDLE:
                begin
                    hresp = 1'b0;
                    hreadyout = 1'b1;
                    state__n = STATE__IDLE;
                end
                AHB__HTRANS__BUSY:
                begin
                    hresp = 1'b0;
                    hreadyout = 1'b1;
                    state__n = STATE__FATAL; 
                end
                AHB__HTRANS__NONSEQ:
                begin
                    hresp = 1'b0;
                    hreadyout = 1'b1;
                    en = hready;
                    state__n = hready ? STATE__TRANSFER : STATE__IDLE; 
                end
                AHB__HTRANS__SEQ:
                begin
                    hresp = 1'b0;
                    hreadyout = 1'b1;
                    state__n = STATE__FATAL; 
                end
            endcase
        end


        //==============================
        // STATE__IDLE
        //==============================
        STATE__IDLE:
        begin
            hresp = 1'b0;
            hreadyout = 1'b1; 
            
            case (htrans)
                AHB__HTRANS__IDLE:
                begin
                    state__n = STATE__IDLE;
                end
                AHB__HTRANS__BUSY:
                begin
                    state__n = hready & hsel ? STATE__FATAL : STATE__IDLE; 
                end
                AHB__HTRANS__NONSEQ:
                begin
                    case (hburst)
                        AHB__HBURST__SINGLE:
                        begin
                            state__n = hready & hsel ? STATE__SINGLE : STATE__IDLE;
                        end
                        AHB__HBURST__INCR:
                        begin
                        end
                        AHB__HBURST__WRAP4:
                        begin
                        end
                        AHB__HBURST__INCR4:
                        begin
                        end
                        AHB__HBURST__WRAP8:
                        begin
                        end
                        AHB__HBURST__INCR8:
                        begin
                        end
                        AHB__HBURST__WRAP16:
                        begin
                        end
                        AHB__HBURST__INCR16:
                        begin
                        end
                    endcase
                end
                AHB__HTRANS__SEQ:
                begin
                    state__n = hready & hsel ? STATE__FATAL : STATE__IDLE; 
                end
            endcase
        end

        //==============================
        // STATE__IDLE
        //==============================
        STATE__IDLE:
        begin
            hresp = 1'b0;
            hreadyout = 1'b1; 
            
            case (htrans)
                AHB__HTRANS__IDLE:
                begin
                    state__n = STATE__IDLE;
                end
                AHB__HTRANS__BUSY:
                begin
                    state__n = hready & hsel ? STATE__FATAL : STATE__IDLE; 
                end
                AHB__HTRANS__NONSEQ:
                begin
                    state__n = hready & hsel ? STATE__ACTIVE : STATE__IDLE;
                end
                AHB__HTRANS__SEQ:
                begin
                    state__n = hready & hsel ? STATE__FATAL : STATE__IDLE; 
                end
            endcase
        end


        //==============================
        // STATE__ACTIVE
        //==============================
        STATE__ACTIVE:
        begin
            hresp = 1'b0;
            hreadyout = 1'b1; 

            case (htrans)
                AHB__HTRANS__IDLE:
                begin
                    state__n = STATE__IDLE;
                end
                AHB__HTRANS__BUSY:
                begin
                    state__n = STATE__ACTIVE; 
                end
                AHB__HTRANS__NONSEQ:
                begin
                    state__n = hsel ? STATE__ACTIVE : STATE__IDLE;
                end
                AHB__HTRANS__SEQ:
                begin
                    state__n = STATE__ACTIVE; 
                end
            endcase
        end



        //==============================
        // STATE__SINGLE
        //==============================
        STATE__SINGLE:
        begin
            hresp = 1'b0;
            hreadyout = 1'b1; 
        end

        //==============================
        // STATE__INCR
        //==============================
        STATE__INCR:
        begin
            hresp = 1'b0;
            hreadyout = 1'b1; 

            case (htrans)
                AHB__HTRANS__IDLE:
                begin
                    state__n = STATE__IDLE;
                end
                AHB__HTRANS__BUSY:
                begin
                    state__n = STATE__INCR; 
                end
                AHB__HTRANS__NONSEQ:
                begin
                    case (hburst)
                        AHB__HBURST__SINGLE:
                        begin
                            state__n = hsel ? STATE__SINGLE : STATE__IDLE;
                        end
                        AHB__HBURST__INCR:
                        begin
                            state__n = hsel ? STATE__INCR : STATE__IDLE;
                        end
                        AHB__HBURST__WRAP4:
                        begin
                            state__n = hsel ? STATE__WRAP4 : STATE__IDLE;
                        end
                        AHB__HBURST__INCR4:
                        begin
                        end
                        AHB__HBURST__WRAP8:
                        begin
                        end
                        AHB__HBURST__INCR8:
                        begin
                        end
                        AHB__HBURST__WRAP16:
                        begin
                        end
                        AHB__HBURST__INCR16:
                        begin
                        end
                    endcase
                end
                AHB__HTRANS__SEQ:
                begin
                    state__n = STATE__INCR; 
                end
            endcase
        end

        //==============================
        // STATE__WRAP4
        //==============================
        STATE__WRAP4:
        begin
            hresp = 1'b0;
            hreadyout = 1'b1; 

            case (htrans)
                AHB__HTRANS__IDLE:
                begin
                    state__n = STATE__FATAL;
                end
                AHB__HTRANS__BUSY:
                begin
                    state__n = STATE__WARP4; 
                end
                AHB__HTRANS__NONSEQ:
                begin
                    state__n = STATE__FATAL;
                end
                AHB__HTRANS__SEQ:
                begin
                    state__n = STATE__WRAP4; 
                end
            endcase
        end






            case (ready)
                1'b0:
                begin
                    hresp = 1'b0;
                    hreadyout = 1'b0;
                    state__n = STATE__TRANSFER;
                end
                1'b1:
                begin
                    case (error)
                        1'b0:
                        begin
                            case (htrans)
                                AHB__HTRANS__IDLE:
                                begin
                                    hresp = 1'b0;
                                    hreadyout = 1'b1;
                                    state__n = STATE__IDLE;
                                end
                                AHB__HTRANS__BUSY:
                                begin
                                    hresp = 1'b0;
                                    hreadyout = 1'b1;
                                    state__n = STATE__FATAL; 
                                end
                                AHB__HTRANS__NONSEQ:
                                begin
                                    en = 1'b1;
                                    state__n = STATE__TRANSFER; 
                                end
                                AHB__HTRANS__SEQ:
                                begin
                                    state__n = STATE__FATAL; 
                                end
                            endcase
                        end
                        1'b1:
                        begin
                            hresp = 1'b1;
                            hreadyout = 1'b0;
                            state__n = STATE__ERROR_CYCLE_2;
                        end
                    endcase
                end
            begin

            hresp = valid ? error ? AHB__  1'b0;
            hreadyout = valid ? error ? ;
            
            case (htrans)
                AHB__HTRANS__IDLE:
                begin
                    state__n = hready ? STATE__IDLE : STATE__TRANSFER;
                end
                AHB__HTRANS__BUSY:
                begin
                    state__n = STATE__FATAL; 
                end
                AHB__HTRANS__NONSEQ:
                begin
                    en = hready;
                    state__n = hready ? STATE__TRANSFER : STATE__IDLE; 
                end
                AHB__HTRANS__SEQ:
                begin
                    state__n = STATE__FATAL; 
                end
            endcase
        end



        //==============================
        // STATE__IDLE
        //==============================
        STATE__IDLE:
        begin

            hresp = 1'b0;
            hreadyout = 1'b1;

            case (htrans)
                AHB__HTRANS__IDLE:
                begin
                    state__n = STATE__IDLE;
                end
                AHB__HTRANS__BUSY:
                begin
                    state__n = STATE__FATAL; 
                end
                AHB__HTRANS__NONSEQ:
                begin
                    en = hready & hsel;
                    state__n = hready & hsel ? STATE__TRANSFER : STATE__IDLE; 
                end
                AHB__HTRANS__SEQ:
                begin
                    state__n = STATE__FATAL; 
                end
            endcase
        end


        //==============================
        // STATE__SINGLE
        //==============================
        STATE__SINGLE:
        begin

            case (ready)
                1'b0:
                begin
                    hresp = 1'b0;
                    hreadyout = 1'b0;
                    state__n = STATE__TRANSFER;
                end
                1'b1:
                begin
                    case (error)
                        1'b0:
                        begin
                            case (htrans)
                                AHB__HTRANS__IDLE:
                                begin
                                    hresp = 1'b0;
                                    hreadyout = 1'b1;
                                    state__n = STATE__IDLE;
                                end
                                AHB__HTRANS__BUSY:
                                begin
                                    hresp = 1'b0;
                                    hreadyout = 1'b1;
                                    state__n = STATE__FATAL; 
                                end
                                AHB__HTRANS__NONSEQ:
                                begin
                                    en = 1'b1;
                                    state__n = STATE__TRANSFER; 
                                end
                                AHB__HTRANS__SEQ:
                                begin
                                    state__n = STATE__FATAL; 
                                end
                            endcase
                        end
                        1'b1:
                        begin
                            hresp = 1'b1;
                            hreadyout = 1'b0;
                            state__n = STATE__ERROR_CYCLE_2;
                        end
                    endcase
                end
            begin

            hresp = valid ? error ? AHB__  1'b0;
            hreadyout = valid ? error ? ;
            
            case (htrans)
                AHB__HTRANS__IDLE:
                begin
                    state__n = hready ? STATE__IDLE : STATE__TRANSFER;
                end
                AHB__HTRANS__BUSY:
                begin
                    state__n = STATE__FATAL; 
                end
                AHB__HTRANS__NONSEQ:
                begin
                    en = hready;
                    state__n = hready ? STATE__TRANSFER : STATE__IDLE; 
                end
                AHB__HTRANS__SEQ:
                begin
                    state__n = STATE__FATAL; 
                end
            endcase
        end

        //==============================
        // STATE__FATAL
        //==============================
        STATE__FATAL:
        begin
            state__n = STATE__FATAL;
        end

    endcase
end


always_ff @(posedge clk) begin
    we <= (hready & hsel) ? hwrite : we;
end

always_ff @(posedge clk) begin
    addr <= (hready & hsel) ? haddr : addr;
end

always_ff @(posedge clk) begin
    state <= ~hresetn ? STATE__RESET : state__n;
end



endmodule
