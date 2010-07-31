/*
 * Copyright (c) 2010 Netcetera AG and others.
 * All rights reserved.
 * This program and the accompanying materials are made available under
 * the terms of the Eclipse Public License v1.0 which accompanies this
 * distribution, and is available at
 *
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 * - Netcetera AG: initial implementation
 */
package st.seaside;

import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertArrayEquals;



public class PharoImageResizerTest {

  private PharoImageResizer builder;

  @Before
  public void setUp() {
    this.builder = new PharoImageResizer("foo", 1032, 1920);
  }

  @Test
  public void getWidthInLittleEndian() {
    assertArrayEquals(new byte[] {0x08, 0x04}, this.builder.getWidthInLittleEndian());
  }

  @Test
  public void getHeightInLittleEndian() {
    assertArrayEquals(new byte[] {(byte) 0x80, 0x07}, this.builder.getHeightInLittleEndian());
  }

  @Test
  public void getDimensionMask() {
    assertArrayEquals(new byte[] {(byte) 0x80, 0x07, 0x08, 0x04}, this.builder.getDimensionMask());
  }

}
