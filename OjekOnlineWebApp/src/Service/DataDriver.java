
package Service;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for dataDriver complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="dataDriver">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="avgrating" type="{http://www.w3.org/2001/XMLSchema}float"/>
 *         &lt;element name="is_active" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="name" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="prefloc" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="ratingcount" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="username" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "dataDriver", propOrder = {
    "avgrating",
    "isActive",
    "name",
    "prefloc",
    "ratingcount",
    "username"
})
public class DataDriver {

    protected float avgrating;
    @XmlElement(name = "is_active")
    protected int isActive;
    protected String name;
    protected String prefloc;
    protected int ratingcount;
    protected String username;

    /**
     * Gets the value of the avgrating property.
     * 
     */
    public float getAvgrating() {
        return avgrating;
    }

    /**
     * Sets the value of the avgrating property.
     * 
     */
    public void setAvgrating(float value) {
        this.avgrating = value;
    }

    /**
     * Gets the value of the isActive property.
     * 
     */
    public int getIsActive() {
        return isActive;
    }

    /**
     * Sets the value of the isActive property.
     * 
     */
    public void setIsActive(int value) {
        this.isActive = value;
    }

    /**
     * Gets the value of the name property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the value of the name property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setName(String value) {
        this.name = value;
    }

    /**
     * Gets the value of the prefloc property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPrefloc() {
        return prefloc;
    }

    /**
     * Sets the value of the prefloc property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPrefloc(String value) {
        this.prefloc = value;
    }

    /**
     * Gets the value of the ratingcount property.
     * 
     */
    public int getRatingcount() {
        return ratingcount;
    }

    /**
     * Sets the value of the ratingcount property.
     * 
     */
    public void setRatingcount(int value) {
        this.ratingcount = value;
    }

    /**
     * Gets the value of the username property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getUsername() {
        return username;
    }

    /**
     * Sets the value of the username property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUsername(String value) {
        this.username = value;
    }

}
