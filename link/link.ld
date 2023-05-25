OUTPUT_ARCH( "riscv" )

ENTRY( _start )

SECTIONS
{
  . = 0x0;
  .text.init : { *(.text.init) }
  .tohost : { *(.tohost) }
  .text : { *(.text) }
  __global_pointer$ = . + 0x800;
  .data : { *(.data) }
  .data.string : { *(.data.string)}
  __bss_start = .;
  .bss : { *(.bss) }
  __BSS_END__ = .;
  _end = .;
}

