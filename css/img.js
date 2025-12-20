const images = [
  "https://evedesigns.org/wp-content/uploads/2024/03/pexels-photo-448714.jpeg",
  "https://evedesigns.org/wp-content/uploads/2024/03/pexels-photo-448714.jpeg",
  "https://evedesigns.org/wp-content/uploads/2024/03/pexels-photo-448714.jpeg",
  "https://images.pexels.com/photos/198162/pexels-photo-198162.jpeg?cs=srgb&dl=adorable-animal-photography-animals-198162.jpg&fm=jpg",
  "https://images.pexels.com/photos/198162/pexels-photo-198162.jpeg?cs=srgb&dl=adorable-animal-photography-animals-198162.jpg&fm=jpg",
  "https://images.pexels.com/photos/198162/pexels-photo-198162.jpeg?cs=srgb&dl=adorable-animal-photography-animals-198162.jpg&fm=jpg"
];
 
document.getElementById("button").addEventListener("click", function () {
  const container = document.getElementById("imageContainer");
  container.innerHTML = "";
 
  for (let row of images) {
    const img = document.createElement("img");
    img.src = row;
    img.style.width = "200px"; // optional styling
    container.appendChild(img);
    container.appendChild(document.createElement("br"));
  }
});